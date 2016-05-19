//
//  DropboxListRevisionsResult.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListRevisionsResult.h"

@implementation DropboxListRevisionsResult

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"\r{\r"];
    [result appendFormat:@"isDeleted: %i\r", self.isDeleted];
    if (self.entries)
    {
        [result appendString:@"entries:\r[\r"];
        for (NSObject *item in self.entries)
        {
            [result appendFormat:@"%@\r", item];
        }
        [result appendString:@"]\r"];
    }
    [result appendString:@"}\r"];
    return result;
}

@end
