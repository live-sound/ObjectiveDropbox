//
//  DropboxGroupTypeParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxGroupTypeParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxGroupTypeParser

+ (DropboxGroupType)groupTypeFromString:(NSString *)string
{
    if ([string isEqualToString:@"team"])
    {
        return DGTTeam;
    }
    else if ([string isEqualToString:@"user_managed"])
    {
        return DGTUserManaged;
    }
    return DGTNotSet;
}

+ (DropboxGroupType)groupTypeFromDictinary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *value = [helper stringWithKey:@".tag"];
    if (value)
    {
        return [self groupTypeFromString:value];
    }
    return DGTNotSet;
}

@end
