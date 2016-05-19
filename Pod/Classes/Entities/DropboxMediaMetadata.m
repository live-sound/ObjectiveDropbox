//
//  DropboxMediaMetadata.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaMetadata.h"

@implementation DropboxMediaMetadata

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"\n("];
    if (self.dimensions)
    {
        [result appendString:[NSString stringWithFormat:@"dimensions: %@\n", self.dimensions]];
    }
    if (self.location)
    {
        [result appendString:[NSString stringWithFormat:@"location: %@\n", self.location]];
    }
    if (self.timeTaken)
    {
        [result appendString:[NSString stringWithFormat:@"timeTaken: %@\n", self.timeTaken]];
    }
    [result appendString:@")"];
    return result;
}

@end
