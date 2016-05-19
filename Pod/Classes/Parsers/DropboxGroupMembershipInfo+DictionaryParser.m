//
//  DropboxGroupMembershipInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxGroupMembershipInfo+DictionaryParser.h"
#import "DropboxBaseMembershipInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxGroupInfo+DictionaryParser.h"

@implementation DropboxGroupMembershipInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSDictionary *groupInfo = [helper dictionaryWithKey:@"group"];
    if (groupInfo)
    {
        self.group = [[DropboxGroupInfo alloc] initWithDictionary:groupInfo];
    }
    
    return self;
}

@end
