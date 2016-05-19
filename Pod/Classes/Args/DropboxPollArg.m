//
//  DropboxPollArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxPollArg.h"

@implementation DropboxPollArg

- (instancetype)initWithAsyncJobID:(NSString *)asyncJobID
{
    self = [super init];
    _asyncJobID = asyncJobID;
    return self;
}

@end
