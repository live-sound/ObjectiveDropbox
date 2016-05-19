//
//  DropboxSharedLinkCreatePolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSharedLinkCreatePolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedLinkCreatePolicyParser

+ (DropboxSharedLinkCreatePolicy)sharedLinkCreatePolicyFromString:(NSString *)string
{
    if ([string isEqualToString:@"default_public"])
    {
        return DSLCPDefaultPublic;
    }
    else if ([string isEqualToString:@"default_team_only"])
    {
        return DSLCPDefaultTeamOnly;
    }
    else if ([string isEqualToString:@"team_only"])
    {
        return DSLCPTeamOnly;
    }
    return DSLCPNotSet;
}

+ (DropboxSharedLinkCreatePolicy)sharedLinkCreatePolicyFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        return [self sharedLinkCreatePolicyFromString:tag];
    }
    return DSLCPNotSet;
}

@end
