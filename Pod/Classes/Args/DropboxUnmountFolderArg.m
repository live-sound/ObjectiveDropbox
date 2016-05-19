//
//  DropboxUnmountFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUnmountFolderArg.h"

@implementation DropboxUnmountFolderArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _sharedFolderID = @"";
    return self;
}

@end
