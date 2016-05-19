//
//  DropboxFullTeam+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxFullTeam+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxTeamSharingPolicies+DictionaryParser.h"

@implementation DropboxFullTeam (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *ID = [helper stringWithKey:@"id"];
    if (ID)
    {
        self.ID = ID;
    }
    
    NSString *name = [helper stringWithKey:@"name"];
    if (name)
    {
        self.name = name;
    }
    
    NSDictionary *sharingPolicies = [helper dictionaryWithKey:@"sharing_policies"];
    if (sharingPolicies)
    {
        self.sharingPolicies = [[DropboxTeamSharingPolicies alloc] initWithDictionary:sharingPolicies];
    }
    
    return self;
}

@end
