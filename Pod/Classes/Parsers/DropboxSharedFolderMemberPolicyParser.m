//
//  DropboxSharedFolderMemberPolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSharedFolderMemberPolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedFolderMemberPolicyParser

+ (DropboxSharedFolderMemberPolicy)sharedFolderMemberPolicyFromString:(NSString *)string
{
    if ([string isEqualToString:@"team"])
    {
        return DSFMPTeam;
    }
    else if ([string isEqualToString:@"anyone"])
    {
        return DSFMPAnyone;
    }
    return DSFMPNotSet;
}

+ (DropboxSharedFolderMemberPolicy)sharedFolderMemberPolicyFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        return [self sharedFolderMemberPolicyFromString:tag];
    }
    return DSFMPNotSet;
}

@end
