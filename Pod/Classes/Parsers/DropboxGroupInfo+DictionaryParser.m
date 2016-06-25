//
//  DropboxGroupInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxGroupInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxGroupTypeParser.h"

@implementation DropboxGroupInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.groupName = [helper stringWithKey:@"group_name"];
        self.groupID = [helper stringWithKey:@"group_id"];
        
        NSDictionary *groupType = [helper dictionaryWithKey:@"group_type"];
        if (groupType)
        {
            self.groupType = [DropboxGroupTypeParser groupTypeFromDictinary:groupType];
        }
        
        self.sameTeam = [helper boolWithKey:@"same_team"];
        self.groupExternalID = [helper stringWithKey:@"group_external_id"];
        self.memberCount = [helper longWithKey:@"member_count"];
    }
    return self;
}

@end
