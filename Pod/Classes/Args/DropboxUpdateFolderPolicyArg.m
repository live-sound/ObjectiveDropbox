//
//  DropboxUpdateFolderPolicyArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUpdateFolderPolicyArg.h"

@implementation DropboxUpdateFolderPolicyArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID memberPolicy:(DropboxMemberPolicy)memberPolicy aclUpdatePolicy:(DropboxAclUpdatePolicy)aclUpdatePolicy sharedLinkPolicy:(DropboxSharedLinkPolicy)sharedLinkPolicy
{
    self = [super init];
    if (self) {
        _sharedFolderID = sharedFolderID;
        _memberPolicy = memberPolicy;
        _aclUpdatePolicy = aclUpdatePolicy;
        _sharedLinkPolicy = sharedLinkPolicy;
    }
    return self;
}

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID
{
    return [self initWithSharedFolderID:sharedFolderID memberPolicy:DMPNotSet aclUpdatePolicy:DAUPNotSet sharedLinkPolicy:DSLPNotSet];
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@""];
}

@end
