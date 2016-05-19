//
//  MediaInfo.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaInfo.h"

@implementation DropboxMediaInfo

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"{ "];
    [result appendString:[NSString stringWithFormat:@"isPending: %i; ", (int)self.isPending]];
    if (self.metadata)
    {
        [result appendString:[NSString stringWithFormat:@"metadata: %@; ", self.metadata]];
    }
    [result appendString:@"}"];
    return result;
}

@end
