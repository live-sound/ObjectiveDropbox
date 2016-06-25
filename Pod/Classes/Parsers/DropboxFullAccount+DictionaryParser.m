//
//  DropboxFullAccount+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxFullAccount+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxName+DictionaryParser.h"
#import "DropboxAccountTypeParser.h"
#import "DropboxFullTeam+DictionaryParser.h"

@implementation DropboxFullAccount (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
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
        
        NSString *locale = [helper stringWithKey:@"locale"];
        if (locale)
        {
            self.locale = locale;
        }
        
        NSString *referralLink = [helper stringWithKey:@"referral_link"];
        if (referralLink)
        {
            self.referralLink = referralLink;
        }
        
        self.isPaired = [helper boolWithKey:@"is_paired"];
        
        NSDictionary *accountType = [helper dictionaryWithKey:@"account_type"];
        if (accountType)
        {
            self.accountType = [DropboxAccountTypeParser accountTypeFromDictionary:accountType];
        }
        
        self.profilePhotoUrl = [helper stringWithKey:@"profile_photo_url"];
        self.country = [helper stringWithKey:@"country"];
        
        NSDictionary *team = [helper dictionaryWithKey:@"team"];
        if (team)
        {
            self.team = [[DropboxFullTeam alloc] initWithDictionary:team];
        }
        
        self.teamMemberID = [helper stringWithKey:@"team_member_id"];
    }
    return self;
}

@end
