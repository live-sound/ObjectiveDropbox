//
//  DropboxGetTemporaryLinkArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetTemporaryLinkArg.h"

@implementation DropboxGetTemporaryLinkArg

- (instancetype)initWithPath:(NSString *)path
{
    self = [self init];
    _path = path;
    return self;
}

@end
