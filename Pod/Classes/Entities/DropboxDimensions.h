//
//  Dimensions.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DropboxDimensions : NSObject

/**
 *  Height of the photo/video.
 */
@property (nonatomic) UInt64 height;

/**
 *  Width of the photo/video.
 */
@property (nonatomic) UInt64 width;

@end
