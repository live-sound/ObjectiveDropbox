//
//  DropboxMediaMetadata.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxDimensions.h"
#import "DropboxGpsCoordinates.h"

@interface DropboxMediaMetadata : NSObject

/**
 *  Dimension of the photo/video. This field is optional.
 */
@property (nonatomic, nullable) DropboxDimensions *dimensions;

/**
 *  The GPS coordinate of the photo/video. This field is optional.
 */
@property (nonatomic, nullable) DropboxGpsCoordinates *location;

/**
 *  The timestamp when the photo/video is taken. This field is optional. 
 */
@property (nonatomic, nullable) NSDate *timeTaken;

@end
