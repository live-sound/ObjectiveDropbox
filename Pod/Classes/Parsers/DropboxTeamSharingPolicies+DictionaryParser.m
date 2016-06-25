//
//  DropboxTeamSharingPolicies+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxTeamSharingPolicies+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxSharedFolderMemberPolicyParser.h"
#import "DropboxSharedFolderJoinPolicyParser.h"
#import "DropboxSharedLinkCreatePolicyParser.h"

@implementation DropboxTeamSharingPolicies (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSDictionary *sharedFolderMemberPolicy = [helper dictionaryWithKey:@"shared_folder_member_policy"];
        if (sharedFolderMemberPolicy)
        {
            self.sharedFolderMemberPolicy = [DropboxSharedFolderMemberPolicyParser sharedFolderMemberPolicyFromDictionary:sharedFolderMemberPolicy];
        }
        
        NSDictionary *sharedFolderJoinPolicy = [helper dictionaryWithKey:@"shared_folder_join_policy"];
        if (sharedFolderJoinPolicy)
        {
            self.sharedFolderJoinPolicy = [DropboxSharedFolderJoinPolicyParser sharedFolderJoinPolicyFromDictionary:sharedFolderJoinPolicy];
        }
        
        NSDictionary *sharedLinkCreatePolicy = [helper dictionaryWithKey:@"shared_link_create_policy"];
        if (sharedLinkCreatePolicy)
        {
            self.sharedLinkCreatePolicy = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromDictionary:sharedLinkCreatePolicy];
        }
    }
    return self;
}

@end
