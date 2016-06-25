//
//  GpsCoordinates.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxGpsCoordinates.h"

@implementation DropboxGpsCoordinates

- (BOOL)isEqual:(id)another
{
    if (self == another)
    {
        return YES;
    }
    
    if (![another isKindOfClass:[DropboxGpsCoordinates class]])
    {
        return NO;
    }
    
    return [self isEqualToGpsCoordinates:(DropboxGpsCoordinates *)another];
}

- (BOOL)isEqualToGpsCoordinates:(DropboxGpsCoordinates *)another
{
    if (!another)
    {
        return NO;
    }
    
    return self.longitude == another.longitude && self.latitude == another.latitude;
}

- (NSUInteger)hash
{
    return ((int)(self.latitude + self.longitude)) % NSUIntegerMax;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(latitude: %f; longitude: %f)", self.latitude, self.longitude];
}

@end
