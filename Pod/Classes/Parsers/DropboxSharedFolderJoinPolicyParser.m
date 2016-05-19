//
//  DropboxSharedFolderJoinPolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSharedFolderJoinPolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedFolderJoinPolicyParser

+ (DropboxSharedFolderJoinPolicy)sharedFolderJoinPolicyFromString:(NSString *)string
{
    if ([string isEqualToString:@"from_team_only"])
    {
        return DSFJPFromTeamOnly;
    }
    else if ([string isEqualToString:@"from_anyone"])
    {
        return DSFJPFromAnyone;
    }
    return DSFJPNotSet;
}

+ (DropboxSharedFolderJoinPolicy)sharedFolderJoinPolicyFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        return [self sharedFolderJoinPolicyFromString:tag];
    }
    return DSFJPNotSet;
}

@end
