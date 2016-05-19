//
//  DropboxUpdateFolderMemberArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUpdateFolderMemberArg.h"

@implementation DropboxUpdateFolderMemberArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID member:(DropboxMemberSelector *)member accessLevel:(DropboxAccessLevel)accessLevel
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    _member = member;
    _accessLevel = accessLevel;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _sharedFolderID = @"";
    _member = [[DropboxMemberSelector alloc] init];
    _accessLevel = DALNotSet;
    return self;
}

@end
