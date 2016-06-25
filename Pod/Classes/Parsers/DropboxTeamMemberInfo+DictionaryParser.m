//
//  DropboxTeamMemberInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxTeamMemberInfo+DictionaryParser.h"
#import "DropboxTeam+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxTeamMemberInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        id teamInfo = [helper dictionaryWithKey:@"team_info"];
        self.teamInfo = [[DropboxTeam alloc] initWithDictionary:teamInfo];
        
        self.displayName = [helper stringWithKey:@"display_name"];
        self.memberID = [helper stringWithKey:@"member_id"];;
    }
    return self;
}

@end
