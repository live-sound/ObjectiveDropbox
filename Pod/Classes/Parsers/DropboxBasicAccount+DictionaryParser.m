//
//  DropboxBasicAccount+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxBasicAccount+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxName+DictionaryParser.h"

@implementation DropboxBasicAccount (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *accountID = [helper stringWithKey:@"account_id"];
    if (accountID)
    {
        self.accountID = accountID;
    }
    
    NSDictionary *name = [helper dictionaryWithKey:@"name"];
    if (name)
    {
        self.name = [[DropboxName alloc] initWithDictionary:name];
    }
    
    NSString *email = [helper stringWithKey:@"email"];
    if (email)
    {
        self.email = email;
    }
    
    self.emailVerified = [helper boolWithKey:@"email_verified"];
    self.disabled = [helper boolWithKey:@"disabled"];
    self.profilePhotoUrl = [helper stringWithKey:@"profile_photo_url"];
    self.isTeammate = [helper boolWithKey:@"is_teammate"];
    self.teamMemberID = [helper stringWithKey:@"team_member_id"];
    
    return self;
}

@end
