//
//  DropboxDownloadTask.h
//  Pods
//
//  Created by Михаил Мотыженков on 13.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxDownloadTaskDelegate.h"

@interface DropboxDownloadTask : NSObject

- (instancetype)initWithTask:(NSURLSessionDownloadTask *)task andWithSession:(NSURLSession *)session andWithDelegate:(id<DropboxDownloadTaskDelegate>)delegate;

- (void)cancel;
- (void)suspendWithCompletion:(void(^)())completionHandler;
- (void)resume;

@property (nonatomic) NSURLSessionDownloadTask *task;
@property (nonatomic) NSURLSession *session;
@property (nonatomic) NSData *resumeData;
@property (nonatomic, weak) id<DropboxDownloadTaskDelegate> delegate;

@end
