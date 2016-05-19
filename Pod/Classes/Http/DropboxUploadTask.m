//
//  DropboxUploadTask.m
//  Pods
//
//  Created by Михаил Мотыженков on 13.05.16.
//
//

#import "DropboxUploadTask.h"

@implementation DropboxUploadTask

- (instancetype)initWithTask:(NSURLSessionUploadTask *)task
{
    self = [self init];
    if (self) {        
        _task = task;
    }
    return self;
}

- (void)cancel
{
    [self.task cancel];
}

- (void)suspend
{
    [self.task suspend];
}

- (void)resume
{
    [self.task resume];
}


@end
