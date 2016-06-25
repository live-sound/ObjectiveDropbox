//
//  GpsCoordinates.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DropboxGpsCoordinates : NSObject

/**
 *  Latitude of the GPS coordinates.
 */
@property (nonatomic) Float64 latitude;

/**
 *  Longitude of the GPS coordinates.
 */
@property (nonatomic) Float64 longitude;

- (BOOL)isEqualToGpsCoordinates:(DropboxGpsCoordinates *)gps;

@end
