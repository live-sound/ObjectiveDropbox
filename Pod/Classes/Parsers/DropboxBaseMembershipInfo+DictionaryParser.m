//
//  DropboxBaseMembershipInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxBaseMembershipInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxAccessLevelDictionaryParser.h"
#import "DropboxMemberPermission+DictionaryParser.h"

@implementation DropboxBaseMembershipInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSDictionary *accessType = [helper dictionaryWithKey:@"access_type"];
        if (accessType)
        {
            self.accessType = [DropboxAccessLevelDictionaryParser accessLevelFromDictionary:accessType];
        }
        
        self.permissions = [helper arrayWithKey:@"permissions" type:[DropboxMemberPermission class]];    
        self.initials = [helper stringWithKey:@"initials"];
        self.isInherited = [helper boolWithKey:@"is_inherited"];
    }
    
    return self;
}

@end
