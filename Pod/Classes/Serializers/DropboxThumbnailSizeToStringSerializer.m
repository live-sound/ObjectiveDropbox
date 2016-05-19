//
//  DropboxThumbnailSizeToStringSerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxThumbnailSizeToStringSerializer.h"

@implementation DropboxThumbnailSizeToStringSerializer

+ (NSString *)stringFromEnum:(DropboxThumbnailSize)size
{
    switch (size) {
        case w32h32:
            return @"w32h32";
        case w64h64:
            return @"w64h64";
        case w128h128:
            return @"w128h128";
        case w640h480:
            return @"w640h480";
        case w1024h768:
            return @"w1024h768";
        default:
            return nil;
    }
}

@end
