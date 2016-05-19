//
//  DropboxRequestedVisibilityParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxRequestedVisibilityParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxRequestedVisibilityParser


+ (DropboxRequestedVisibility)requestedVisibilityFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id visibility = [helper stringWithKey:@".tag"];
    if (visibility)
    {
        return [self requestedVisibilityFromString:visibility];
    }
    return DRVNotSet;
}

+ (DropboxRequestedVisibility)requestedVisibilityFromString:(NSString *)string
{
    if ([string isEqualToString:@"public"])
    {
        return DRVPublic;
    }
    else if ([string isEqualToString:@"team_only"])
    {
        return DRVTeamOnly;
    }
    else if ([string isEqualToString:@"password"])
    {
        return DRVPassword;
    }
    else
    {
        return DRVNotSet;
    }
}

@end
