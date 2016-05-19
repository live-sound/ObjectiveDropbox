//
//  DropboxUserInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxUserInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxUserInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.accountID = [helper stringWithKey:@"account_id"];
    self.sameTeam = [helper boolWithKey:@"same_team"];
    self.teamMemberID = [helper stringWithKey:@"team_member_id"];
    
    return self;
}

@end
