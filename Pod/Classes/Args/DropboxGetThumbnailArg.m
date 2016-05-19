//
//  DropboxThumbnailArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetThumbnailArg.h"

@implementation DropboxGetThumbnailArg

- (instancetype)initWithPath:(NSString *)path format:(DropboxThumbnailFormat)format size:(DropboxThumbnailSize)size
{
    self = [self init];
    _path = path;
    _size = size;
    _format = format;
    return self;
}

@end
