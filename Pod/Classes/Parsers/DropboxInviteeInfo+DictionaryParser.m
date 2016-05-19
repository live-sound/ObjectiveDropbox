//
//  DropboxInviteeInfo+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxInviteeInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxInviteeInfoEnumParser.h"

@implementation DropboxInviteeInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *string = [helper stringWithKey:@".tag"];
    if (string)
    {
        self.type = [DropboxInviteeInfoEnumParser inviteeInfoFromString:string];
        self.value = [helper stringWithKey:string];
    }
    return self;
}

@end
