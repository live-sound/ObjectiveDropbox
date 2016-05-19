//
//  DropboxUrlSessionDelegate.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import "DropboxUrlSessionDelegate.h"
#import "DropboxDownloadTaskStorage.h"
#import "DropboxUploadTaskStorage.h"


NSString * const kSessionNotification = @"ObjectiveDropboxBackgroundSessionUpdated";
NSString * const kSessionID = @"sessionIdentifier";
NSString * const kCompletionHandler = @"completionHandler";

@interface DropboxUrlSessionDelegate ()

@property (nonatomic) NSString *savePath;

@end


@implementation DropboxUrlSessionDelegate
{
    NSMutableDictionary<NSString *, void(^)()> *completionHandlers;
    NSMutableDictionary<NSString *, NSMutableDictionary<NSNumber *, DropboxDownloadTaskStorage *> *> *downloadTasks;
    NSMutableDictionary<NSString *, NSMutableDictionary<NSNumber *, DropboxUploadTaskStorage *> *> *uploadTasks;    
    NSMutableDictionary<NSNumber *, NSMutableData *> *responsesData;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        completionHandlers = [NSMutableDictionary new];
        downloadTasks = [NSMutableDictionary new];
        uploadTasks = [NSMutableDictionary new];
        responsesData = [NSMutableDictionary new];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveBackgroundSessionHandler:) name:kSessionNotification object:nil];
    }
    return self;
}

- (void)restartAllTasksFromSession:(NSURLSession *)session
{
    __block UIBackgroundTaskIdentifier bgTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [[UIApplication sharedApplication] endBackgroundTask:bgTask];
    }];
    
    [session getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *_uploadTasks, NSArray *_downloadTasks) {
        for(NSURLSessionUploadTask *task in _uploadTasks) {
            [self addUploadTask:task session:session successHandler:nil progressHandler:nil failHandler:nil];
            [task resume];
            NSLog(@"Restored upload task %zu for %@", (unsigned long)task.taskIdentifier, task.originalRequest.URL);
        }
        
        NSDictionary<NSString *, NSDictionary<NSNumber *, NSDictionary<NSString *, id> *> *> *restoredDownloadTasks = [self restoreDownloadTasks];
        NSDictionary<NSNumber *, NSDictionary<NSString *, id> *> *restoredTasksForSession = restoredDownloadTasks[session.configuration.identifier];
        if (restoredDownloadTasks && restoredTasksForSession)
        {
            for (NSURLSessionDownloadTask *task in _downloadTasks) {
                NSDictionary *headers = task.originalRequest.allHTTPHeaderFields;
                NSDictionary<NSString *, id> *taskStorage = restoredTasksForSession[headers[@"Dropbox-API-Arg"]];
                NSString *destUrlString = taskStorage[@"fileURL"];
                if (taskStorage && destUrlString)
                {
                    [self addDownloadTask:task session:session destinationUrl:[NSURL URLWithString:destUrlString] successHandler:nil progressHandler:nil failHandler:nil];
                    [task resume];
                    NSLog(@"Restored download task %zu for %@", (unsigned long)task.taskIdentifier, task.originalRequest.URL);
                }
                else
                {
                    [task cancel];
                }
            }
        }
        
        [[UIApplication sharedApplication] endBackgroundTask:bgTask];
    }];
}

- (void)saveDownloadTasks
{
    NSMutableDictionary *dic = [NSMutableDictionary new];
    for (NSString *key in downloadTasks.allKeys)
    {
        NSMutableDictionary<NSNumber *, DropboxDownloadTaskStorage *> *obj = downloadTasks[key];
        if (!obj) continue;
        
        NSMutableDictionary *taskDic = [NSMutableDictionary new];
        for (NSNumber *number in obj.allKeys)
        {
            DropboxDownloadTaskStorage *dts = obj[number];
            if (!dts) continue;
            
            NSMutableDictionary *taskStorage = [NSMutableDictionary new];
            taskStorage[@"fileURL"] = dts.destinationUrl.absoluteString;
            NSDictionary *headers = dts.task.originalRequest.allHTTPHeaderFields;
            taskDic[headers[@"Dropbox-API-Arg"]] = taskStorage;
        }
        dic[key] = taskDic;
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dic];
    [data writeToFile:self.savePath atomically:YES];
}

- (NSDictionary<NSString *, NSDictionary<NSNumber *, NSDictionary<NSString *, id> *> *> *)restoreDownloadTasks
{
    NSData *data = [NSData dataWithContentsOfFile:self.savePath];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

- (NSString *)savePath
{
    if (!_savePath)
    {
        _savePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"downloadTasks.plist"];
    }
    return _savePath;
}

- (void)saveBackgroundSessionHandler:(NSNotification *)notification
{
    NSString *ID = notification.userInfo[@"sessionIdentifier"];
    if (ID) {
        completionHandlers[ID] = notification.userInfo[@"completionHandler"];
    }
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - DropboxUrlSessionDelegateProtocol

- (DropboxDownloadTask *)addDownloadTask:(NSURLSessionDownloadTask *)task session:(NSURLSession *)session destinationUrl:(NSURL *)destUrl successHandler:(DownloadTaskSuccessHandler)successBlock progressHandler:(DownloadTaskProgressHandler)progressBlock failHandler:(DownloadTaskFailHandler)failBlock
{
    NSMutableDictionary *sessionDic = downloadTasks[session.configuration.identifier];
    if (!sessionDic)
    {
        sessionDic = downloadTasks[session.configuration.identifier] = [NSMutableDictionary new];
    }
    DropboxDownloadTaskStorage *dts = [DropboxDownloadTaskStorage new];
    dts.successHandler = successBlock;
    dts.progressHandler = progressBlock;
    dts.failHandler = failBlock;
    dts.task = task;    
    dts.destinationUrl = destUrl;
    sessionDic[@(task.taskIdentifier)] = dts;
    [self saveDownloadTasks];
    return [[DropboxDownloadTask alloc] initWithTask:task andWithSession:session andWithDelegate:self];
}

- (DropboxUploadTask *)addUploadTask:(NSURLSessionUploadTask *)task session:(NSURLSession *)session successHandler:(UploadTaskSuccessHandler)successBlock progressHandler:(UploadTaskProgressHandler)progressBlock failHandler:(UploadTaskFailHandler)failBlock
{
    NSMutableDictionary *sessionDic = uploadTasks[session.configuration.identifier];
    if (!sessionDic)
    {
        sessionDic = uploadTasks[session.configuration.identifier] = [NSMutableDictionary new];
    }
    DropboxUploadTaskStorage *uts = [DropboxUploadTaskStorage new];
    uts.successHandler = successBlock;
    uts.progressHandler = progressBlock;
    uts.failHandler = failBlock;
    uts.task = task;
    sessionDic[@(task.taskIdentifier)] = uts;
    return [[DropboxUploadTask alloc] initWithTask:task];
}

#pragma mark - NSURLSession delegate

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    DropboxDownloadTaskStorage *dts = downloadTasks[session.configuration.identifier][@(downloadTask.taskIdentifier)];
    if (dts)
    {
        if (dts.progressHandler)
        {
            dts.progressHandler(bytesWritten, totalBytesWritten, totalBytesExpectedToWrite);
        }
    }
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    NSMutableDictionary *downloadTaskDic = downloadTasks[session.configuration.identifier];
    if (downloadTaskDic)
    {
        DropboxDownloadTaskStorage *dts = downloadTaskDic[@(downloadTask.taskIdentifier)];
        if (dts)
        {
            NSError *error;            
            [[NSFileManager defaultManager] moveItemAtURL:location toURL:dts.destinationUrl error:&error];
            if (error)
            {
                if (dts.failHandler)
                {
                    dts.failHandler(error.localizedDescription);
                }
            }
            else if (dts.successHandler)
            {
                NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)downloadTask.response;
                dts.successHandler(httpResponse.allHeaderFields, httpResponse.statusCode);
            }
            [downloadTaskDic removeObjectForKey:@(downloadTask.taskIdentifier)];
            [self saveDownloadTasks];
        }
    }
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data
{
    if (!uploadTasks[session.configuration.identifier][@(dataTask.taskIdentifier)])
        return;
    
    NSMutableData *responseData = responsesData[@(dataTask.taskIdentifier)];
    if (!responseData) {
        responseData = [NSMutableData dataWithData:data];
        responsesData[@(dataTask.taskIdentifier)] = responseData;
    } else {
        [responseData appendData:data];
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error
{
    if (error && [task isKindOfClass:[NSURLSessionDownloadTask class]])
    {
        NSMutableDictionary *downloadTaskDic = downloadTasks[session.configuration.identifier];
        if (downloadTaskDic)
        {
            DropboxDownloadTaskStorage *dts = downloadTaskDic[@(task.taskIdentifier)];
            if (dts)
            {
                [downloadTaskDic removeObjectForKey:@(task.taskIdentifier)];
                [self saveDownloadTasks];
            }
        }
    }
    else if ([task isKindOfClass:[NSURLSessionUploadTask class]])
    {
        NSMutableDictionary *uploadTaskDic = uploadTasks[session.configuration.identifier];
        if (uploadTaskDic)
        {
            DropboxUploadTaskStorage *uts = uploadTaskDic[@(task.taskIdentifier)];
            if (uts)
            {
                if (error)
                {
                    if (uts.failHandler)
                    {
                        uts.failHandler(error.localizedDescription);
                    }
                }
                if (uts.successHandler)
                {
                    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)uts.task.response;
                    uts.successHandler(httpResponse.allHeaderFields, responsesData[@(task.taskIdentifier)], httpResponse.statusCode);
                }
                [uploadTaskDic removeObjectForKey:@(task.taskIdentifier)];
                [responsesData removeObjectForKey:@(task.taskIdentifier)];
            }
        }
    }
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didSendBodyData:(int64_t)bytesSent totalBytesSent:(int64_t)totalBytesSent totalBytesExpectedToSend:(int64_t)totalBytesExpectedToSend
{
    DropboxUploadTaskStorage *uts = uploadTasks[session.configuration.identifier][@(task.taskIdentifier)];
    if (uts)
    {
        if (uts.progressHandler)
        {
            uts.progressHandler(bytesSent, totalBytesSent, totalBytesExpectedToSend);
        }
    }
}

- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session
{
    void(^completionHandler)() = completionHandlers[session.configuration.identifier];
    if (completionHandler)
    {
        NSMutableDictionary *downloadTaskDic = downloadTasks[session.configuration.identifier];
        [downloadTaskDic removeAllObjects];
        NSMutableDictionary *uploadTaskDic = uploadTasks[session.configuration.identifier];
        [uploadTaskDic removeAllObjects];
        completionHandler();
        [completionHandlers removeObjectForKey:session.configuration.identifier];
    }
}

#pragma mark - DropboxDownloadTaskDelegate

- (void)downloadTaskDidResumeWithOldTask:(NSURLSessionDownloadTask *)oldTask newTask:(NSURLSessionDownloadTask *)newTask session:(NSURLSession *)session
{
    DropboxDownloadTaskStorage *dts = downloadTasks[session.configuration.identifier][@(oldTask.taskIdentifier)];
    if (dts)
    {
        [self addDownloadTask:newTask session:session destinationUrl:dts.destinationUrl successHandler:dts.successHandler progressHandler:dts.progressHandler failHandler:dts.failHandler];
        [downloadTasks[session.configuration.identifier] removeObjectForKey:@(oldTask.taskIdentifier)];
    }
}

@end
