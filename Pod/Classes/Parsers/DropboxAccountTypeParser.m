//
//  DropboxAccountTypeParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxAccountTypeParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxAccountTypeParser

+ (DropboxAccountType)accountTypeFromString:(NSString *)string
{
    if ([string isEqualToString:@"basic"])
    {
        return DATBasic;
    }
    else if ([string isEqualToString:@"pro"])
    {
        return DATPro;
    }
    else if ([string isEqualToString:@"business"])
    {
        return DATBusiness;
    }
    return DATNotSet;
}

+ (DropboxAccountType)accountTypeFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        return [self accountTypeFromString:tag];
    }
    return DATNotSet;
}

@end
