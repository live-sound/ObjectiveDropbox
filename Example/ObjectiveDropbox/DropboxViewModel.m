//
//  DropboxViewModel.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import "DropboxViewModel.h"

static NSString * const appKey = @"j5pztc1kvmgbly2";
static NSString * const redirectURL = @"http://localhost";

static NSString * const uploadFileName = @"Картинка";
static NSString * const uploadFileExt = @"jpg";


@implementation DropboxViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        _dropbox = [[DropboxClient alloc] initWithAppKey:appKey redirectURL:redirectURL restartAllTasksAfterRelaunch:YES];
    }
    return self;
}

- (instancetype)initWithDelegate:(id<DropboxViewModelDelegate>)delegate
{
    self = [self init];
    if (self) {
        _delegate = delegate;
    }    
    return self;
}


- (void)checkTokenWithSuccess:(void(^ _Nullable)(void))successBlock fail:(void(^ _Nullable)(void))failBlock;
{
    if (self.dropbox.accessToken)
    {
        if (successBlock)
        {
            successBlock();
        }
    }
    else
    {
        [self.dropbox getNewTokenWithSuccess:^ {
            NSLog(@"Token received successfully");            
            if (successBlock)
            {
                successBlock();
            }
        } fail:^(NSString * _Nonnull errorSummary) {
            NSLog(@"Failed to receive token: %@", errorSummary);
            if (failBlock)
            {
                failBlock();
            }
        }];
    }    
}

- (void)startTesting
{
    [self checkTokenWithSuccess:^{
        NSFileManager *fm = [NSFileManager defaultManager];
        NSArray<NSURL *> *tempFiles = [fm contentsOfDirectoryAtURL:[NSURL fileURLWithPath:NSTemporaryDirectory()] includingPropertiesForKeys:@[NSURLNameKey] options:NSDirectoryEnumerationSkipsHiddenFiles error:nil];
        for (NSURL *url in tempFiles)
        {
            [fm removeItemAtURL:url error:nil];
        }
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_group_t group = dispatch_group_create();
        
        // Upload
        dispatch_group_enter(group);
        DropboxCommitInfo *commitInfo = [[DropboxCommitInfo alloc] initWithPath:[self getUploadedFilePath] mode:[[DropboxWriteMode alloc] initWithOverwrite]];
        [self.dropbox.files upload:commitInfo sourceFileUrl:[NSURL fileURLWithPath:[self getFilePath]] progress:^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
            NSLog(@"Upload progress %lli%%", totalBytesSent/totalBytesExpectedToSend);
        }
        success:^(DropboxFileMetadata * _Nonnull uploadResult) {
            [self sendSuccess:[NSString stringWithFormat:@"Upload succeded with results: %@", uploadResult]];
            
            // Download
            dispatch_group_enter(group);
            DropboxDownloadArg *downloadArg = [[DropboxDownloadArg alloc] initWithPath:[self getUploadedFilePath]];
            NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"file.f"];
            __block DropboxDownloadTask *downloadTask = [self.dropbox.files download:downloadArg destFileUrl:[NSURL fileURLWithPath:filePath] progress:^(int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalBytesExpectedToWrite) {
                long long percent = totalBytesWritten/totalBytesExpectedToWrite;
                NSLog(@"Download progress %lli%%", percent);
                if (percent == 1)
                {
                    [downloadTask suspendWithCompletion:^{
                        [downloadTask resume];
                    }];                    
                }                
            } success:^(DropboxFileMetadata * _Nonnull metadata) {
                [self sendSuccess:[NSString stringWithFormat:@"Download succeded with result: %@", metadata]];                
                dispatch_group_leave(group);
            } fail:^(DropboxError * _Nonnull error) {
                [self sendError:[NSString stringWithFormat:@"Download failed with error: %@", error.errorSummary]];
                dispatch_group_leave(group);
            }];
            
            // ListRevisions
            dispatch_group_enter(group);
            DropboxListRevisionsArg *arg = [[DropboxListRevisionsArg alloc] initWithPath:[self getUploadedFilePath] limit:10];
            [self.dropbox.files listRevisions:arg success:^(DropboxListRevisionsResult * _Nonnull result) {
                [self sendSuccess:[NSString stringWithFormat:@"ListRevisions succeded with result: %@", result]];
            
                // Delete
                dispatch_group_enter(group);
                DropboxDeleteArg *deleteArg = [[DropboxDeleteArg alloc] initWithPath:[self getUploadedFilePath]];
                [self.dropbox.files delete:deleteArg success:^(DropboxMetadata * _Nonnull metadata) {
                    [self sendSuccess:[NSString stringWithFormat:@"Delete succeded with result: %@", metadata]];
                    
                    // RestoreRevision
                    dispatch_group_enter(group);
                    DropboxRestoreArg *restoreRevisionArg = [[DropboxRestoreArg alloc] initWithPath:[self getUploadedFilePath] rev:uploadResult.rev];
                    [self.dropbox.files restore:restoreRevisionArg success:^(DropboxFileMetadata * _Nonnull result) {
                        [self sendSuccess:[NSString stringWithFormat:@"Restore succeded with result: %@", result]];
                        
                        // Move
                        dispatch_group_enter(group);
                        DropboxRelocationArg *moveArg = [[DropboxRelocationArg alloc] initWithFromPath:[self getUploadedFilePath] toPath:[self getMovedFilePath]];
                        [self.dropbox.files move:moveArg success:^(DropboxMetadata * _Nonnull result) {
                            [self sendSuccess:[NSString stringWithFormat:@"Move succeded with result: %@", result]];
                            
                            // Delete moved file
                            dispatch_group_enter(group);
                            DropboxDeleteArg *deleteArg = [[DropboxDeleteArg alloc] initWithPath:[self getMovedFilePath]];
                            [self.dropbox.files delete:deleteArg success:^(DropboxMetadata * _Nonnull metadata) {
                                [self sendSuccess:[NSString stringWithFormat:@"Delete succeded with result: %@", metadata]];
                                dispatch_group_leave(group);
                            } fail:^(DropboxError * _Nonnull error) {
                                [self sendError:[NSString stringWithFormat:@"Delete failed with error: %@", error.errorSummary]];
                                dispatch_group_leave(group);
                            }];
                            
                            dispatch_group_leave(group);
                        } fail:^(DropboxError * _Nonnull error) {
                            [self sendError:[NSString stringWithFormat:@"Move failed with error: %@", error.errorSummary]];
                            
                            // Delete moved file
                            dispatch_group_enter(group);
                            DropboxDeleteArg *deleteArg1 = [[DropboxDeleteArg alloc] initWithPath:[self getMovedFilePath]];
                            [self.dropbox.files delete:deleteArg1 success:^(DropboxMetadata * _Nonnull metadata) {
                                [self sendSuccess:[NSString stringWithFormat:@"Delete succeded with result: %@", metadata]];
                                dispatch_group_leave(group);
                            } fail:^(DropboxError * _Nonnull error) {
                                [self sendError:[NSString stringWithFormat:@"Delete failed with error: %@", error.errorSummary]];
                                dispatch_group_leave(group);
                            }];
                            
                            // Delete original file
                            dispatch_group_enter(group);
                            DropboxDeleteArg *deleteArg2 = [[DropboxDeleteArg alloc] initWithPath:[self getUploadedFilePath]];
                            [self.dropbox.files delete:deleteArg2 success:^(DropboxMetadata * _Nonnull metadata) {
                                [self sendSuccess:[NSString stringWithFormat:@"Delete succeded with result: %@", metadata]];
                                dispatch_group_leave(group);
                            } fail:^(DropboxError * _Nonnull error) {
                                [self sendError:[NSString stringWithFormat:@"Delete failed with error: %@", error.errorSummary]];
                                dispatch_group_leave(group);
                            }];
                            
                            dispatch_group_leave(group);
                        }];
                        
                        dispatch_group_leave(group);
                    } fail:^(DropboxError * _Nonnull error) {
                        [self sendError:[NSString stringWithFormat:@"Restore failed with error: %@", error.errorSummary]];
                        dispatch_group_leave(group);
                    }];
                    
                    dispatch_group_leave(group);
                } fail:^(DropboxError * _Nonnull error) {
                    [self sendError:[NSString stringWithFormat:@"Delete failed with error: %@", error.errorSummary]];
                    dispatch_group_leave(group);
                }];
                
                dispatch_group_leave(group);
            } fail:^(DropboxError * _Nonnull error) {
                [self sendError:[NSString stringWithFormat:@"ListRevisions failed with error: %@", error.errorSummary]];
                dispatch_group_leave(group);
            }];
            
            dispatch_group_leave(group);
        }
        fail:^(DropboxError * _Nonnull error) {
            [self sendError:[NSString stringWithFormat:@"Upload failed with error: %@", error.errorSummary]];
            dispatch_group_leave(group);
        }];
        
        // Search
        dispatch_group_enter(group);
        DropboxSearchArg *searchArg = [[DropboxSearchArg alloc] initWithPath:@"" query:@"g"];
        [self.dropbox.files search:searchArg success:^(DropboxSearchResult * _Nonnull result) {
            [self sendSuccess:[NSString stringWithFormat:@"Search succeded with result: %@", result]];
            dispatch_group_leave(group);
        }
        fail:^(DropboxError * _Nonnull error) {
            [self sendError:[NSString stringWithFormat:@"Search failed with error: %@", error.errorSummary]];
            dispatch_group_leave(group);
        }];
        
        // ListFolder
        dispatch_group_enter(group);
        DropboxListFolderArg *listFolderArg1 = [[DropboxListFolderArg alloc] initWithPath:@""];
        [self.dropbox.files listFolder:listFolderArg1 success:^(DropboxListFolderResult * _Nonnull result) {
            [self sendSuccess:[NSString stringWithFormat:@"ListFolder succeded with result: %@", result]];
            
            // ListFolderContinue
            dispatch_group_enter(group);
            [self.dropbox.files listFolderContinue:[[DropboxListFolderContinueArg alloc] initWithCursor:result.cursor] success:^(DropboxListFolderResult * _Nonnull result) {
                [self sendSuccess:[NSString stringWithFormat:@"ListFolderContinue succeded with result %@", result]];
                dispatch_group_leave(group);
            } fail:^(DropboxError * _Nonnull error) {
                [self sendError:[NSString stringWithFormat:@"ListFolderContinue failed with error: %@", error.errorSummary]];
                dispatch_group_leave(group);
            }];
            
            dispatch_group_leave(group);
        } fail:^(DropboxError * _Nonnull error) {
            [self sendError:[NSString stringWithFormat:@"ListFolder failed with error: %@", error.errorSummary]];
            dispatch_group_leave(group);
        }];
        
        // ListFolderGetLatestCursor
        dispatch_group_enter(group);
        DropboxListFolderArg *listFolderArg2 = [[DropboxListFolderArg alloc] initWithPath:@""];
        [self.dropbox.files listFolderGetLatestCursor:listFolderArg2 success:^(DropboxListFolderGetLatestCursorResult * _Nonnull result) {
            [self sendSuccess:[NSString stringWithFormat:@"listFolderGetLatestCursor succeded with result %@", result]];
            dispatch_group_leave(group);
        } fail:^(DropboxError * _Nonnull error) {
            [self sendError:[NSString stringWithFormat:@"ListFolderGetLatestCurosr failed with error: %@", error.errorSummary]];
            dispatch_group_leave(group);
        }];
        
        // UploadSession methods
        dispatch_group_enter(group);
        [self uploadSessionWithSuccess:^{
            dispatch_group_leave(group);
        } failBlock:^(DropboxError * _Nonnull error) {
            dispatch_group_leave(group);
        }];
        
        dispatch_group_notify(group, queue, ^{
            [self finishTesting];
        });
    } fail:^{
        [self finishTesting];
    }];
}

- (void)finishTesting
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewModelTestingFinished)])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate viewModelTestingFinished];
        });
    }
}

- (NSString *)getFilePath
{
    return [[NSBundle mainBundle] pathForResource:uploadFileName ofType:uploadFileExt];
}

- (NSString *)getUploadedFilePath
{
    return [NSString stringWithFormat:@"/%@.%@", uploadFileName, uploadFileExt];
}

- (NSString *)getMovedFilePath
{
    return @"/moved.file";
}

- (void)sendError:(NSString *)error
{
    NSLog(@"%@", error);
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewModelError:)])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate viewModelError:error];
        });
    }
}

- (void)sendSuccess:(NSString *)success
{
    NSLog(@"%@", success);
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewModelSuccess:)])
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate viewModelSuccess:success];
        });
    }
}

#pragma mark - files

- (void)uploadSessionWithSuccess:(void(^)(void))successBlock failBlock:(ErrorBlock)failBlock
{
    NSData *data = [NSData dataWithContentsOfFile:[self getFilePath]];
    NSURL *url1 = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"file01.part"]];
    NSURL *url2 = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"file02.part"]];
    NSURL *url3 = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"file03.part"]];
    NSUInteger offset1 = 0;
    NSUInteger len = data.length/3;
    NSData *data1 = [data subdataWithRange:NSMakeRange(offset1, len)];
    [data1 writeToURL:url1 atomically:NO];
    data1 = nil;
    NSUInteger offset2 = offset1 + len;
    NSData *data2 = [data subdataWithRange:NSMakeRange(offset2, len)];
    [data2 writeToURL:url2 atomically:NO];
    data2 = nil;
    NSUInteger offset3 = offset2 + len;
    len = data.length - offset3;
    NSData *data3 = [data subdataWithRange:NSMakeRange(offset3, len)];
    [data3 writeToURL:url3 atomically:NO];
    data3 = nil;
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    [self.dropbox.files uploadSessionStart:[DropboxUploadSessionStartArg new] sourceFileUrl:url1 progress:nil success:^(DropboxUploadSessionStartResult * _Nonnull result)
    {
        [self sendSuccess:[NSString stringWithFormat:@"UploadSessionStart succeded"]];
        [fm removeItemAtURL:url1 error:nil];
        DropboxUploadSessionAppendArg *appendArg = [[DropboxUploadSessionAppendArg alloc] initWithCursor:[[DropboxUploadSessionCursor alloc] initWithSessionID:result.sessionID offset:offset2] close:NO];
        [self.dropbox.files uploadSessionAppend:appendArg sourceFileUrl:url2 progress:nil success:^
        {
            [self sendSuccess:[NSString stringWithFormat:@"UploadSessionAppend succeded"]];
            [fm removeItemAtURL:url2 error:nil];
            DropboxCommitInfo *commitInfo = [[DropboxCommitInfo alloc] initWithPath:[NSString stringWithFormat:@"/%@.%@", uploadFileName, uploadFileExt] mode:[[DropboxWriteMode alloc] initWithOverwrite]];
            DropboxUploadSessionFinishArg *arg = [[DropboxUploadSessionFinishArg alloc] initWithCursor:[[DropboxUploadSessionCursor alloc] initWithSessionID:result.sessionID offset:offset3] commit:commitInfo];
            [self.dropbox.files uploadSessionFinish:arg sourceFileUrl:url3 progress:nil success:^(DropboxFileMetadata * _Nonnull result)
            {
                [self sendSuccess:[NSString stringWithFormat:@"UploadSessionFinish succeded"]];
                [fm removeItemAtURL:url3 error:nil];
                successBlock();
            }
            fail:^(DropboxError * _Nonnull error)
            {
                [self sendError:[NSString stringWithFormat:@"UploadSessionFinish failed with error: %@", error.errorSummary]];
                [fm removeItemAtURL:url3 error:nil];
                failBlock(error);
            }];
        }
        fail:^(DropboxError * _Nonnull error)
        {
            [self sendError:[NSString stringWithFormat:@"UploadSessionAppend failed with error: %@", error.errorSummary]];
            [fm removeItemAtURL:url2 error:nil];
            [fm removeItemAtURL:url3 error:nil];
            failBlock(error);
        }];
    }
    fail:^(DropboxError * _Nonnull error)
    {
        [self sendError:[NSString stringWithFormat:@"UploadSessionStart failed with error: %@", error.errorSummary]];
        [fm removeItemAtURL:url1 error:nil];
        [fm removeItemAtURL:url2 error:nil];
        [fm removeItemAtURL:url3 error:nil];
        failBlock(error);
    }];
}

@end
