//
//  DropboxDownloadTaskStorage.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUrlSessionHandlers.h"

@interface DropboxDownloadTaskStorage : NSObject

@property (nonatomic) DownloadTaskSuccessHandler successHandler;
@property (nonatomic) DownloadTaskProgressHandler progressHandler;
@property (nonatomic) DownloadTaskFailHandler failHandler;
@property (nonatomic) NSURLSessionDownloadTask *task;
@property (nonatomic) NSData *resumeData;
@property (nonatomic) NSURL *destinationUrl;

@end
