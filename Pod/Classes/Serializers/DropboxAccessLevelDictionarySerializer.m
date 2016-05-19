//
//  DropboxAccessLevelDictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAccessLevelDictionarySerializer.h"

@implementation DropboxAccessLevelDictionarySerializer

+ (NSDictionary *)dictionaryFromAccessLevel:(DropboxAccessLevel)accessLevel
{
    NSString *result = [self stringFromEnum:accessLevel];
    if (!result)
    {
        return @{};
    }
    return @{ @".tag": result };
}

+ (NSString * _Nullable)stringFromEnum:(DropboxAccessLevel)accessLevel
{
    switch (accessLevel) {
        case DALOwner:
            return @"owner";
        case DALEditor:
            return @"editor";
        case DALViewer:
            return @"viewer";
        default:
            return nil;
    }
}

@end
