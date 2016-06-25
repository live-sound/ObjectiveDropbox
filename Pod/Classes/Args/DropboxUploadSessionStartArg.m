
//
//  DropboxUploadSessionStartArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionStartArg.h"

@implementation DropboxUploadSessionStartArg

- (instancetype)initWithClose:(BOOL)close
{
    self = [super init];
    if (self) {
        _close = close;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithClose:NO];
}

@end
