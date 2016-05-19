//
//  DropboxShareFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxShareFolderArg.h"

@implementation DropboxShareFolderArg

- (instancetype)initWithPath:(NSString *)path memberPolicy:(DropboxMemberPolicy)memberPolicy aclUpdatePolicy:(DropboxAclUpdatePolicy)aclUpdatePolicy sharedLinkPolicy:(DropboxSharedLinkPolicy)sharedLinkPolicy forceAsync:(BOOL)forceAsync
{
    self = [super init];
    _path = path;
    _memberPolicy = memberPolicy;
    _aclUpdatePolicy = aclUpdatePolicy;
    _sharedLinkPolicy = sharedLinkPolicy;
    _forceAsync = forceAsync;
    return self;
}

- (instancetype)initWithPath:(NSString *)path
{
    return [self initWithPath:path memberPolicy:DMPAnyone aclUpdatePolicy:DAUPOwner sharedLinkPolicy:DSLPAnyone forceAsync:NO];
}

- (instancetype)init
{
    return [self initWithPath:@"/"];
}

@end
