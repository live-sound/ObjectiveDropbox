//
//  DropboxTeamSharingPolicies.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxTeamSharingPolicies.h"

@implementation DropboxTeamSharingPolicies

- (instancetype)init
{
    self = [super init];
    if (self) {
        _sharedFolderMemberPolicy = DSFMPNotSet;
        _sharedFolderJoinPolicy = DSFJPNotSet;
        _sharedLinkCreatePolicy = DSLCPNotSet;
    }
    return self;
}

@end
