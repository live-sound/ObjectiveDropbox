//
//  DropboxShareFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxShareFolderArg+DictionarySerializer.h"
#import "DropboxMemberPolicySerializer.h"
#import "DropboxAclUpdatePolicySerializer.h"
#import "DropboxSharedLinkPolicySerializer.h"


@implementation DropboxShareFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"path": self.path,
              @"member_policy": [DropboxMemberPolicySerializer stringFromEnum:self.memberPolicy],
              @"acl_update_policy": [DropboxAclUpdatePolicySerializer stringFromEnum:self.aclUpdatePolicy],
              @"shared_link_policy": [DropboxSharedLinkPolicySerializer stringFromEnum:self.sharedLinkPolicy],
              @"force_async": @(self.forceAsync) };
}

@end
