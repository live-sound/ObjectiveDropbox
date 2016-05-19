//
//  DropboxSharedFolderMetadata+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxSharedFolderMetadata+DictionaryParser.h"
#import "DropboxAccessLevelDictionaryParser.h"
#import "DropboxFolderPolicy+DictionaryParser.h"
#import "NSString+DropboxStringToDate.h"
#import "DropboxTeam+DictionaryParser.h"
#import "DropboxFolderPermission+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedFolderMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id accessType = [helper dictionaryWithKey:@"access_type"];
    if (accessType)
    {
        self.accessType = [DropboxAccessLevelDictionaryParser accessLevelFromDictionary:accessType];
    }
    
    self.isTeamFolder = [helper boolWithKey:@"is_team_folder"];
    
    id policy = [helper dictionaryWithKey:@"policy"];
    if (policy)
    {
        self.policy = [[DropboxFolderPolicy alloc] initWithDictionary:policy];
    }
    
    self.name = [helper stringWithKey:@"name"];
    self.sharedFolderID = [helper stringWithKey:@"shared_folder_id"];
    self.timeInvited = [helper dateWithKey:@"time_invited"];
    
    id ownerTeam = [helper dictionaryWithKey:@"owner_team"];
    if (ownerTeam)
    {
        self.ownerTeam = [[DropboxTeam alloc] initWithDictionary:ownerTeam];
    }
    
    self.parentSharedFolderID = [helper stringWithKey:@"parent_shared_folder_id"];
    self.pathLower = [helper stringWithKey:@"path_lower"];    
    self.permissions = [helper arrayWithKey:@"permissions" type:[DropboxFolderPermission class]];
    
    return self;
}

@end
