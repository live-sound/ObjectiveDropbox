//
//  DropboxThumbnailFormatToStringSerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxThumbnailFormatToStringSerializer.h"

@implementation DropboxThumbnailFormatToStringSerializer

+ (NSString *)stringFromEnum:(DropboxThumbnailFormat)format
{
    switch (format) {
        case JPEG:
            return @"jpeg";
        case PNG:
            return @"png";
        default:
            return nil;
    }
}

@end
