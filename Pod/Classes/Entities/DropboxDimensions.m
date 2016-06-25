//
//  Dimensions.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxDimensions.h"

@implementation DropboxDimensions

- (BOOL)isEqual:(id)another
{
    if (self == another)
    {
        return YES;
    }
    if (![another isKindOfClass:[DropboxDimensions class]])
    {
        return NO;
    }
    return [self isEqualToDimensions:(DropboxDimensions *)another];
}

- (BOOL)isEqualToDimensions:(DropboxDimensions *)another
{
    if (!another)
    {
        return NO;
    }
    return self.width == another.width && self.height == another.height;
}

- (NSUInteger)hash
{
    return (self.width + self.height) % NSUIntegerMax;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ %llu x %llu }", self.width, self.height];
}

@end
