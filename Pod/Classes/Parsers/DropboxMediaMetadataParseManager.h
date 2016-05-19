//
//  DropboxMediaMetadataManager.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxPhotoMetadata.h"
#import "DropboxVideoMetadata.h"

@interface DropboxMediaMetadataParseManager : NSObject

+ (DropboxMediaMetadata *)initMediaMetadataWithDictionary:(NSDictionary *)dic;

@end
