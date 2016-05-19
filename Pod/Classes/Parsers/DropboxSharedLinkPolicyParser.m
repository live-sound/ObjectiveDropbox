//
//  DropboxSharedLinkPolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxSharedLinkPolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedLinkPolicyParser

+ (DropboxSharedLinkPolicy)sharedLinkPolicyFromDictionary:(NSDictionary * _Nonnull)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *result = [helper stringWithKey:@".tag"];
    if (result)
    {
        return [self sharedLinkPolicyFromString:result];
    }
    return DSLPNotSet;
}

+ (DropboxSharedLinkPolicy)sharedLinkPolicyFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"anyone"])
    {
        return DSLPAnyone;
    }
    else if ([string isEqualToString:@"members"])
    {
        return DSLPMembers;
    }
    return DSLPNotSet;
}

@end
