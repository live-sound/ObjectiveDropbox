//
//  DropboxUpdateFolderPolicyArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUpdateFolderPolicyArg+DictionarySerializer.h"
#import "DropboxMemberPolicySerializer.h"
#import "DropboxAclUpdatePolicySerializer.h"
#import "DropboxSharedLinkPolicySerializer.h"

@implementation DropboxUpdateFolderPolicyArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"shared_folder_id"] = self.sharedFolderID;
    
    NSString *memberPolicy = [DropboxMemberPolicySerializer stringFromEnum:self.memberPolicy];
    if (memberPolicy)
    {
        result[@"member_policy"] = memberPolicy;
    }
    
    NSString *aclUpdatePolicy = [DropboxAclUpdatePolicySerializer stringFromEnum:self.aclUpdatePolicy];
    if (aclUpdatePolicy)
    {
        result[@"acl_update_policy"] = aclUpdatePolicy;
    }
    
    NSString *sharedLinkPolicy = [DropboxSharedLinkPolicySerializer stringFromEnum:self.sharedLinkPolicy];
    if (sharedLinkPolicy)
    {
        result[@"shared_link_policy"] = sharedLinkPolicy;
    }
    
    return result;
}

@end
