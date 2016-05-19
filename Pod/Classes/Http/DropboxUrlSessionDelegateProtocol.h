//
//  DropboxUrlSessionDelegateProtocol.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUrlSessionHandlers.h"
#import "DropboxDownloadTask.h"
#import "DropboxUploadTask.h"

@protocol DropboxUrlSessionDelegateProtocol <NSObject, NSURLSessionDelegate, NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate, NSURLSessionDataDelegate>

- (DropboxDownloadTask *)addDownloadTask:(NSURLSessionDownloadTask *)task
                session:(NSURLSession *)session
         destinationUrl:(NSURL *)destUrl
         successHandler:(DownloadTaskSuccessHandler)successBlock
        progressHandler:(DownloadTaskProgressHandler)progressBlock
            failHandler:(DownloadTaskFailHandler)failBlock;

- (DropboxUploadTask *)addUploadTask:(NSURLSessionUploadTask *)task
              session:(NSURLSession *)session
       successHandler:(UploadTaskSuccessHandler)successBlock
      progressHandler:(UploadTaskProgressHandler)progressBlock
          failHandler:(UploadTaskFailHandler)failBlock;


@end
