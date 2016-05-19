//
//  DropboxTeamMemberInfo+DropboxSharedLinkMetadataDictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxSharedLinkMetadata+DictionaryParser.h"
#import "DropboxLinkPermissions+DictionaryParser.h"
#import "DropboxTeamMemberInfo+DictionaryParser.h"
#import "DropboxTeam+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedLinkMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.url = [helper stringWithKey:@"url"];
    self.name = [helper stringWithKey:@"name"];
    
    id linkPermissions = [helper dictionaryWithKey:@"link_permissions"];
    if (linkPermissions)
    {
        self.linkPermissions = [[DropboxLinkPermissions alloc] initWithDictionary:linkPermissions];
    }
    
    self.ID = [helper stringWithKey:@"id"];
    self.expires = [helper dateWithKey:@"expires"];
    self.pathLower = [helper stringWithKey:@"path_lower"];
    
    id teamMemberInfo = [helper dictionaryWithKey:@"team_member_info"];
    if (teamMemberInfo)
    {
        self.teamMemberInfo = [[DropboxTeamMemberInfo alloc] initWithDictionary:teamMemberInfo];
    }
    
    id contentOwnerTeamInfo = [helper dictionaryWithKey:@"content_owner_team_info"];
    if (contentOwnerTeamInfo)
    {
        self.contentOwnerTeamInfo = [[DropboxTeam alloc] initWithDictionary:contentOwnerTeamInfo];
    }
    
    return self;
}

@end
