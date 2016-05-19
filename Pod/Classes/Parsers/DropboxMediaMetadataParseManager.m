//
//  DropboxMediaMetadataManager.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaMetadataParseManager.h"
#import "DropboxVideoMetadata+DictionaryParser.h"
#import "DropboxPhotoMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxMediaMetadataParseManager

+ (DropboxMediaMetadata *)initMediaMetadataWithDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id duration = [helper dictionaryWithKey:@"duration"];
    if (duration)
    {
        return [[DropboxVideoMetadata alloc] initWithDictionary:dic];
    }
    else
    {
        return [[DropboxPhotoMetadata alloc] initWithDictionary:dic];
    }
}

@end
