//
//  DropboxUploadTaskStorage.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUrlSessionHandlers.h"

@interface DropboxUploadTaskStorage : NSObject

@property (nonatomic) UploadTaskSuccessHandler successHandler;
@property (nonatomic) UploadTaskProgressHandler progressHandler;
@property (nonatomic) UploadTaskFailHandler failHandler;
@property (nonatomic) NSURLSessionUploadTask *task;

@end
