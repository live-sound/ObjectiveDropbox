//
//  DropboxUploadTask.h
//  Pods
//
//  Created by Михаил Мотыженков on 13.05.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxUploadTask : NSObject

- (instancetype)initWithTask:(NSURLSessionUploadTask *)task;

- (void)cancel;
- (void)suspend;
- (void)resume;

@property (nonatomic) NSURLSessionUploadTask *task;

@end
