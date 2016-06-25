//
//  DropboxRelinquishFolderMembershipArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxRelinquishFolderMembershipArg.h"

@implementation DropboxRelinquishFolderMembershipArg

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
