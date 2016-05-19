//
//  DropboxAccessLevelDictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAccessLevelDictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxAccessLevelDictionaryParser

+ (DropboxAccessLevel)accessLevelFromDictionary:(NSDictionary * _Nonnull)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id string = [helper stringWithKey:@".tag"];
    if (string)
    {
        return [self accessLevelFromString:string];
    }
    return DALNotSet;
}

+ (DropboxAccessLevel)accessLevelFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"owner"])
    {
        return DALOwner;
    }
    else if ([string isEqualToString:@"editor"])
    {
        return DALEditor;
    }
    else if ([string isEqualToString:@"viewer"])
    {
        return DALViewer;
    }
    return DALNotSet;
}

@end
