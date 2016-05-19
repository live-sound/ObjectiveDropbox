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
    if ([another isKindOfClass:[DropboxGpsCoordinates class]])
    {
        DropboxGpsCoordinates *anotherGps = (DropboxGpsCoordinates *)another;
        return self.longitude == anotherGps.longitude && self.latitude == anotherGps.latitude;
    }
    else
    {
        return NO;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(latitude: %f; longitude: %f)", self.latitude, self.longitude];
}

@end
