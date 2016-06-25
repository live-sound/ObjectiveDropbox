//
//  DropboxFilesRoutes.m
//  Pods
//
//  Created by Михаил Мотыженков on 02.04.16.
//
//

#import "ObjectiveDropboxError.h"
#import "DropboxFilesRoutes.h"
#import "DropboxRelocationArg+DictionarySerializer.h"
#import "DropboxMetadataParseManager.h"
#import "DropboxCreateFolderArg+DictionarySerializer.h"
#import "DropboxFolderMetadata+DictionaryParser.h"
#import "DropboxDeleteArg+DictionarySerializer.h"
#import "DropboxDownloadArg+DictionarySerializer.h"
#import "DropboxFileMetadata+DictionaryParser.h"
#import "DropboxGetMetadataArg+DictionarySerializer.h"
#import "DropboxGetPreviewArg+DictionarySerializer.h"
#import "DropboxGetTemporaryLinkArg+DictionarySerializer.h"
#import "DropboxGetTemporaryLinkResult+DictionaryParser.h"
#import "DropboxGetThumbnailArg+DictionarySerializer.h"
#import "DropboxListFolderArg+DictionarySerializer.h"
#import "DropboxListFolderResult+DictionaryParser.h"
#import "DropboxListFolderContinueArg+DictionarySerializer.h"
#import "DropboxListFolderGetLatestCursorResult+DictionaryParser.h"
#import "DropboxListFolderLongpollArg+DictionarySerializer.h"
#import "DropboxListFolderLongpollResult+DictionaryParser.h"
#import "DropboxListRevisionsArg+DictionarySerializer.h"
#import "DropboxListRevisionsResult+DictionaryParser.h"
#import "DropboxRestoreArg+DictionarySerializer.h"
#import "DropboxSearchArg+DictionarySerializer.h"
#import "DropboxSearchResult+DictionaryParser.h"
#import "DropboxCommitInfo+DictionarySerializer.h"
#import "DropboxUploadSessionAppendArg+DictionarySerializer.h"
#import "DropboxUploadSessionFinishArg+DictionarySerializer.h"
#import "DropboxUploadSessionStartArg+DictionarySerializer.h"
#import "DropboxUploadSessionStartResult+DictionaryParser.h"
#import "NSURL+FileOperations.h"

const long maxSize = 150 * 1024 * 1024;


@implementation DropboxFilesRoutes

- (void)copy:(DropboxRelocationArg *)arg success:(void (^)(DropboxMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"copy" param:arg parseManager:[DropboxMetadataParseManager class] success:successBlock fail:failBlock];
}

- (void)createFolder:(DropboxCreateFolderArg *)arg success:(void (^)(DropboxFolderMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"create_folder" param:arg resultType:[DropboxFolderMetadata class] success:successBlock fail:failBlock];
}

- (void)delete:(DropboxDeleteArg *)arg success:(void (^)(DropboxMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"delete" param:arg parseManager:[DropboxMetadataParseManager class] success:successBlock fail:failBlock];
}

- (DropboxDownloadTask *)download:(DropboxDownloadArg * _Nonnull)arg destFileUrl:(NSURL *)destFileUrl progress:(DownloadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull metadata))successBlock fail:(nullable ErrorBlock)failBlock
{
    return [self.delegate contentDownloadEndpointWithRoute:@"download" param:arg destinationFileUrl:destFileUrl resultType:[DropboxFileMetadata class] progress:progressBlock success:successBlock fail:failBlock];
}

- (void)getMetadata:(DropboxGetMetadataArg *)arg success:(void (^)(DropboxMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_metadata" param:arg parseManager:[DropboxMetadataParseManager class] success:successBlock fail:failBlock];
}

- (DropboxDownloadTask *)getPreview:(DropboxGetPreviewArg *)arg destFileUrl:(NSURL *)destFileUrl progress:(DownloadTaskProgressHandler)progressBlock success:(void (^)(DropboxFileMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentDownloadEndpointWithRoute:@"get_preview" param:arg destinationFileUrl:destFileUrl resultType:[DropboxFileMetadata class] progress:progressBlock success:successBlock fail:failBlock];
}

- (void)getTemporaryLink:(DropboxGetTemporaryLinkArg *)arg success:(void (^)(DropboxGetTemporaryLinkResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_temporary_link" param:arg resultType:[DropboxGetTemporaryLinkResult class] success:successBlock fail:failBlock];
}

- (DropboxDownloadTask *)getThumbnail:(DropboxGetThumbnailArg *)arg destFileUrl:(NSURL *)destFileUrl progress:(DownloadTaskProgressHandler)progressBlock success:(void (^)(DropboxFileMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentDownloadEndpointWithRoute:@"get_thumbnail" param:arg destinationFileUrl:destFileUrl resultType:[DropboxFileMetadata class] progress:progressBlock success:successBlock fail:failBlock];
}

- (void)listFolder:(DropboxListFolderArg *)arg success:(void (^)(DropboxListFolderResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder" param:arg resultType:[DropboxListFolderResult class] success:successBlock fail:failBlock];
}

- (void)listFolderContinue:(DropboxListFolderContinueArg *)arg success:(void (^)(DropboxListFolderResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder/continue" param:arg resultType:[DropboxListFolderResult class] success:successBlock fail:failBlock];
}

- (void)listFolderGetLatestCursor:(DropboxListFolderArg *)arg success:(void (^)(DropboxListFolderGetLatestCursorResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder/get_latest_cursor" param:arg resultType:[DropboxListFolderGetLatestCursorResult class] success:successBlock fail:failBlock];
}

- (void)listFolderLongpoll:(DropboxListFolderLongpollArg *)arg success:(void (^)(DropboxListFolderLongpollResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder/longpoll" param:arg resultType:[DropboxListFolderLongpollResult class] success:successBlock fail:failBlock];
}

- (void)listRevisions:(DropboxListRevisionsArg *)arg success:(void (^)(DropboxListRevisionsResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_revisions" param:arg resultType:[DropboxListRevisionsResult class] success:successBlock fail:failBlock];
}

- (void)move:(DropboxRelocationArg *)arg success:(void (^)(DropboxMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"move" param:arg parseManager:[DropboxMetadataParseManager class] success:successBlock fail:failBlock];
}

- (void)permanentlyDelete:(DropboxDeleteArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"permanently_delete" param:arg success:successBlock fail:failBlock];
}

- (void)restore:(DropboxRestoreArg * _Nonnull)arg success:(void (^)(DropboxFileMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"restore" param:arg resultType:[DropboxFileMetadata class] success:successBlock fail:failBlock];
}

- (void)search:(DropboxSearchArg *)arg success:(void (^)(DropboxSearchResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"search" param:arg resultType:[DropboxSearchResult class] success:successBlock fail:failBlock];
}

#pragma mark - Upload

- (DropboxUploadTask *)upload:(DropboxCommitInfo *)arg sourceFileUrl:(NSURL *)sourceFileUrl progress:(UploadTaskProgressHandler)progressBlock success:(void (^)(DropboxFileMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    __block NSError *error;
    unsigned long long size = [sourceFileUrl fileSizeWithError:&error];
    if (error)
    {
        if (failBlock)
        {
            failBlock([[DropboxError alloc] initWithErrorSummary:error.localizedDescription]);
        }
        return nil;
    }
    if (size > maxSize)
    {
        NSArray<NSURL *> *pieces = [sourceFileUrl splitFileBySizeInBytes:maxSize error:&error];
        if (error)
        {
            if (failBlock)
            {
                failBlock([[DropboxError alloc] initWithErrorSummary:error.localizedDescription]);
            }
            return nil;
        }
        __block int64_t realTotalBytesSent = 0;
        __block DropboxUploadTask *uploadTask = [self uploadSessionStart:[DropboxUploadSessionStartArg new] sourceFileUrl:pieces[0] progress:^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
            if (progressBlock)
            {
                progressBlock(bytesSent, totalBytesSent, size);
            }
        } success:^(DropboxUploadSessionStartResult * _Nonnull result) {
            error = nil;
            realTotalBytesSent = [pieces[0] fileSizeWithError:&error];
            if (error)
            {
                if (failBlock)
                {
                    failBlock([[DropboxError alloc] initWithErrorSummary:error.localizedDescription]);
                }
            }
            else
            {
                if (pieces.count > 2)
                {
                    __block BOOL breakLoop = NO;
                    dispatch_semaphore_t sem = dispatch_semaphore_create(0);
                    for (int i = 1; i < pieces.count-1; i++)
                    {
                        DropboxUploadSessionCursor *cursor = [[DropboxUploadSessionCursor alloc] initWithSessionID:result.sessionID offset:realTotalBytesSent];
                        DropboxUploadSessionAppendArg *appendArg = [[DropboxUploadSessionAppendArg alloc] initWithCursor:cursor close:NO];                        
                        
                        DropboxUploadTask *appendTask = [self uploadSessionAppend:appendArg sourceFileUrl:pieces[i] progress:^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
                            if (progressBlock)
                            {
                                progressBlock(bytesSent, realTotalBytesSent + totalBytesSent, size);
                            }
                        } success:^{
                            error = nil;
                            realTotalBytesSent += [pieces[i] fileSizeWithError:&error];
                            if (error)
                            {
                                if (failBlock)
                                {
                                    failBlock([[DropboxError alloc] initWithErrorSummary:error.localizedDescription]);
                                }
                                breakLoop = YES;
                            }
                            dispatch_semaphore_signal(sem);
                        } fail:^(DropboxError * _Nonnull error) {
                            if (failBlock)
                            {
                                failBlock(error);
                            }
                            breakLoop = YES;
                            dispatch_semaphore_signal(sem);
                        }];
                        uploadTask.task = appendTask.task;
                        dispatch_semaphore_wait(sem, DISPATCH_TIME_FOREVER);
                        if (breakLoop) break;
                    }
                    if (!breakLoop)
                    {
                        DropboxUploadTask *finishTask = [self finishUploadSessionWithTotalBytesSent:realTotalBytesSent sessionID:result.sessionID arg:arg pieces:pieces failBlock:failBlock successBlock:successBlock size:size progressBlock:progressBlock];
                        uploadTask.task = finishTask.task;
                    }
                }
                else
                {
                    DropboxUploadTask *finishTask = [self finishUploadSessionWithTotalBytesSent:realTotalBytesSent sessionID:result.sessionID arg:arg pieces:pieces failBlock:failBlock successBlock:successBlock size:size progressBlock:progressBlock];
                    uploadTask.task = finishTask.task;
                }
            }
        } fail:failBlock];
        return uploadTask;
    }
    else
    {
        return [self.delegate contentUploadEndpointWithRoute:@"upload" param:arg fileUrl:sourceFileUrl resultType:[DropboxFileMetadata class] progress:progressBlock success:successBlock fail:failBlock];
    }
}

- (DropboxUploadTask *)finishUploadSessionWithTotalBytesSent:(int64_t)realTotalBytesSent sessionID:(NSString *)sessionID arg:(DropboxCommitInfo *)arg pieces:(NSArray<NSURL *> *)pieces failBlock:(ErrorBlock)failBlock successBlock:(void (^)(DropboxFileMetadata *))successBlock size:(unsigned long long)size progressBlock:(UploadTaskProgressHandler)progressBlock
{
    DropboxUploadSessionCursor *cursor = [[DropboxUploadSessionCursor alloc] initWithSessionID:sessionID offset:realTotalBytesSent];
    DropboxUploadSessionFinishArg *finishArg = [[DropboxUploadSessionFinishArg alloc] initWithCursor:cursor commit:arg];
    return [self uploadSessionFinish:finishArg sourceFileUrl:pieces.lastObject progress:^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
        if (progressBlock)
        {
            progressBlock(bytesSent, realTotalBytesSent + totalBytesSent, size);
        }
    } success:successBlock fail:failBlock];
}


- (DropboxUploadTask *)uploadSessionAppend:(DropboxUploadSessionAppendArg *)arg sourceFileUrl:(NSURL *)sourceFileUrl progress:(UploadTaskProgressHandler)progressBlock success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentUploadEndpointWithRoute:@"upload_session/append_v2" param:arg fileUrl:sourceFileUrl resultType:Nil progress:progressBlock success:^(id<DictionaryParser> _Nullable result) {
        if (successBlock)
        {
            successBlock();
        }
    } fail:failBlock];
}

- (DropboxUploadTask *)uploadSessionFinish:(DropboxUploadSessionFinishArg *)arg sourceFileUrl:(NSURL *)sourceFileUrl progress:(UploadTaskProgressHandler)progressBlock success:(void (^)(DropboxFileMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentUploadEndpointWithRoute:@"upload_session/finish" param:arg fileUrl:sourceFileUrl resultType:[DropboxFileMetadata class] progress:progressBlock success:successBlock fail:failBlock];
}

- (DropboxUploadTask *)uploadSessionStart:(DropboxUploadSessionStartArg *)arg sourceFileUrl:(NSURL *)sourceFileUrl progress:(UploadTaskProgressHandler)progressBlock success:(void (^)(DropboxUploadSessionStartResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentUploadEndpointWithRoute:@"upload_session/start" param:arg fileUrl:sourceFileUrl resultType:[DropboxUploadSessionStartResult class] progress:progressBlock success:successBlock fail:failBlock];
}

@end
