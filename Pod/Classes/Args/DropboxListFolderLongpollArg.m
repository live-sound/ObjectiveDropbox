//
//  DropboxListFolderLongpollArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderLongpollArg.h"

@implementation DropboxListFolderLongpollArg

- (instancetype)initWithCursor:(NSString *)cursor timeout:(UInt64)timeout
{
    self = [self init];
    _cursor = cursor;
    _timeout = timeout;
    return self;
}

@end
