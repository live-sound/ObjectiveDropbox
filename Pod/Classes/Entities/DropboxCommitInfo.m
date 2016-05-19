//
//  DropboxCommitInfo.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxCommitInfo.h"

@implementation DropboxCommitInfo

- (instancetype)initWithPath:(NSString *)path mode:(DropboxWriteMode *)mode autorename:(BOOL)autorename clientModified:(NSDate *)clientModified mute:(BOOL)mute
{
    self = [super init];
    _path = path;
    _mode = mode;
    _autorename = autorename;
    _clientModified = clientModified;
    _mute = mute;
    return self;
}

- (instancetype)initWithPath:(NSString *)path mode:(DropboxWriteMode *)mode
{
    return [self initWithPath:path mode:mode autorename:NO clientModified:nil mute:NO];
}

@end
