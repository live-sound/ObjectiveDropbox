//
//  DropboxInviteeMembershipInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxInviteeMembershipInfo+DictionaryParser.h"
#import "DropboxBaseMembershipInfo+DictionaryParser.h"
#import "DropboxUserInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxInviteeInfo+DictionaryParser.h"

@implementation DropboxInviteeMembershipInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    
    NSDictionary *invitee = [helper dictionaryWithKey:@"invitee"];
    if (invitee)
    {
        self.invitee = [[DropboxInviteeInfo alloc] initWithDictionary:invitee];
    }
    
    NSDictionary *user = [helper dictionaryWithKey:@"user"];
    if (user)
    {
        self.user = [[DropboxUserInfo alloc] initWithDictionary:user];
    }

    
    return self;
}

@end
