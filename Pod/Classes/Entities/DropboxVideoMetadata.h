//
//  DropboxVideoMetadata.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaMetadata.h"

@interface DropboxVideoMetadata : DropboxMediaMetadata

/**
 *  The duration of the video in milliseconds.
 */
@property (nonatomic) UInt64 duration;

@end
