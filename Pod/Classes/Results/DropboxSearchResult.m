//
//  DropboxSearchResult.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchResult.h"

@implementation DropboxSearchResult

- (instancetype)init
{
    self = [super init];
    _matches = [NSArray new];
    return self;
}

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"{ "];
    if (self.matches)
    {
        [result appendString:@"matches:\r[\r"];
        for (NSObject *item in self.matches)
        {
            [result appendFormat:@"%@\r", item];
        }
        [result appendString:@"]\r"];
    }
    [result appendString:@"}"];
    return result;
}

@end
