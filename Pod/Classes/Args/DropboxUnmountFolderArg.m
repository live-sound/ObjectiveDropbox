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
    if (self) {
        _sharedFolderID = sharedFolderID;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@""];
}

@end
