//
//  DropboxResolvedVisibilityParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxResolvedVisibilityParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxResolvedVisibilityParser

+ (DropboxResolvedVisibility)resolvedVisibilityFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id result = [helper stringWithKey:@".tag"];
    if (result)
    {
        return [self resolvedVisibilityFromString:result];
    }
    return DResolvedVisibilityNotSet;
}

+ (DropboxResolvedVisibility)resolvedVisibilityFromString:(NSString *)string
{
    if ([string isEqualToString:@"public"])
    {
        return DResolvedVisibilityPublic;
    }
    else if ([string isEqualToString:@"team_only"])
    {
        return DResolvedVisibilityTeamOnly;
    }
    else if ([string isEqualToString:@"password"])
    {
        return DResolvedVisibilityPassword;
    }
    else if ([string isEqualToString:@"team_and_password"])
    {
        return DResolvedVisibilityTeamAndPassword;
    }
    else if ([string isEqualToString:@"shared_folder_only"])
    {
        return DResolvedVisibilitySharedFolderOnly;
    }
    else
    {
        return DResolvedVisibilityNotSet;
    }
}

@end
