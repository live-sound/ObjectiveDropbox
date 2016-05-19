//
//  DropboxSearchMatchTypeDictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchMatchTypeParseManager.h"
#import "DropboxDefines.h"

@implementation DropboxSearchMatchTypeParseManager

+ (DropboxSearchMatchType)searchMatchTypeFromDictionary:(NSDictionary *)dic
{
    NSString *result = dic[@".tag"];
    if (!NotNull(result))
    {
        return unknown;
    }
    DropboxSearchMatchType searchMatchType = [self searchMatchTypeFromString:result];
    return searchMatchType;
}

+ (DropboxSearchMatchType)searchMatchTypeFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"filename"])
    {
        return filename;
    }
    else if ([string isEqualToString:@"content"])
    {
        return content;
    }
    else if ([string isEqualToString:@"both"])
    {
        return both;
    }
    else
    {
        return unknown;
    }
}

@end
