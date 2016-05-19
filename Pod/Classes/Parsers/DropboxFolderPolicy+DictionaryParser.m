//
//  DropboxFolderPolicy+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxFolderPolicy+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxAclUpdatePolicyParser.h"
#import "DropboxSharedLinkPolicyParser.h"
#import "DropboxMemberPolicyParser.h"

@implementation DropboxFolderPolicy (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id aclUpdatePolicy = [helper dictionaryWithKey:@"acl_update_policy"];
    if (aclUpdatePolicy)
    {
        self.aclUpdatePolicy = [DropboxAclUpdatePolicyParser aclUpdatePolicyFromDictionary:aclUpdatePolicy];
    }
    
    id sharedLinkPolicy = [helper dictionaryWithKey:@"shared_link_policy"];
    if (sharedLinkPolicy)
    {
        self.sharedLinkPolicy = [DropboxSharedLinkPolicyParser sharedLinkPolicyFromDictionary:sharedLinkPolicy];
    }
    
    id memberPolicy = [helper dictionaryWithKey:@"member_policy"];
    if (memberPolicy)
    {
        self.memberPolicy = [DropboxMemberPolicyParser memberPolicyFromDictionary:memberPolicy];
    }
    
    id resolvedMemberPolicy = [helper dictionaryWithKey:@"resolved_member_policy"];
    if (resolvedMemberPolicy)
    {
        self.resolvedMemberPolicy = [DropboxMemberPolicyParser memberPolicyFromDictionary:resolvedMemberPolicy];
    }
    
    return self;
}

@end
