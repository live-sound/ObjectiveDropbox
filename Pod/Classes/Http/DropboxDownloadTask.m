//
//  DropboxDownloadTask.m
//  Pods
//
//  Created by Михаил Мотыженков on 13.05.16.
//
//

#import "DropboxDownloadTask.h"

@implementation DropboxDownloadTask

- (instancetype)initWithTask:(NSURLSessionDownloadTask *)task andWithSession:(NSURLSession *)session andWithDelegate:(id<DropboxDownloadTaskDelegate>)delegate
{
    self = [self init];
    if (self) {
        _task = task;
        _session = session;        
        _delegate = delegate;
    }
    return self;
}

- (void)cancel
{
    [self.task cancel];
}

- (void)suspendWithCompletion:(void (^)())completionHandler
{
    [self.task cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
        self.resumeData = resumeData;
        if (completionHandler)
        {
            completionHandler();
        }
    }];
}

- (void)resume
{
    NSURLSessionDownloadTask *newTask;
    if (self.resumeData)
    {
        newTask = [self.session downloadTaskWithResumeData:self.resumeData];
    }
    else
    {
        newTask = [self.session downloadTaskWithRequest:self.task.currentRequest];
    }
    [self.delegate downloadTaskDidResumeWithOldTask:self.task newTask:newTask session:self.session];
    self.task = newTask;
    [self.task resume];
}

@end
