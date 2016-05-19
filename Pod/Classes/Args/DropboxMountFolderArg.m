//
//  DropboxMountFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxMountFolderArg.h"

@implementation DropboxMountFolderArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    return self;
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@""];
}

@end
