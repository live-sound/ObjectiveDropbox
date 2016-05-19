//
//  DropboxUserMembershipInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxUserMembershipInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxUserInfo+DictionaryParser.h"
#import "DropboxBaseMembershipInfo+DictionaryParser.h"

@implementation DropboxUserMembershipInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];    
    NSDictionary *user = [helper dictionaryWithKey:@"user"];
    if (user)
    {
        self.user = [[DropboxUserInfo alloc] initWithDictionary:user];
    }
    
    return self;
}

@end
