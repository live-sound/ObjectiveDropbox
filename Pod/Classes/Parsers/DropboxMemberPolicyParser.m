//
//  DropboxMemberPolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxMemberPolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxMemberPolicyParser

+ (DropboxMemberPolicy)memberPolicyFromDictionary:(NSDictionary * _Nonnull)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *result = [helper stringWithKey:@".tag"];
    if (result)
    {
        return [self memberPolicyFromString:result];
    }
    return DMPNotSet;
}

+ (DropboxMemberPolicy)memberPolicyFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"team"])
    {
        return DMPTeam;
    }
    else if ([string isEqualToString:@"anyone"])
    {
        return DMPAnyone;
    }
    return DMPNotSet;
}

@end
