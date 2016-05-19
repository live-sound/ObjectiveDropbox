//
//  DropboxListFolderResult.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 29.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxListFolderResult.h"

@implementation DropboxListFolderResult

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"{ "];
    [result appendFormat:@"cursor: %@; ", self.cursor];
    [result appendFormat:@"hasMore: %i; ", self.hasMore];
    if (self.entries)
    {
        [result appendString:@"entries:\r[\r"];
        for (NSObject *item in self.entries)
        {
            [result appendFormat:@"%@\r", item];
        }
        [result appendString:@"]\r"];
    }
    [result appendString:@"}"];
    return result;
}

@end
