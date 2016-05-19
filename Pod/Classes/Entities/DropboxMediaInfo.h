//
//  MediaInfo.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxMediaMetadata.h"


@interface DropboxMediaInfo : NSObject

/**
 *  Indicate the photo/video is still under processing and metadata is not available yet.
 */
@property (nonatomic) BOOL isPending;

/**
 *  The metadata for the photo/video.
 */
@property (nonatomic, nullable) DropboxMediaMetadata *metadata;

@end
