//
//  DropboxThumbnailArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxThumbnailFormat.h"
#import "DropboxThumbnailSize.h"

@interface DropboxGetThumbnailArg : NSObject

/**
 *  The path to the image file you want to thumbnail.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  The format for the thumbnail image, jpeg (default) or png. For images that are photos, jpeg should be preferred, while png is better for screenshots and digital arts. The default for this union is jpeg.
 */
@property (nonatomic) DropboxThumbnailFormat format;

/**
 *  The size for the thumbnail image. The default for this union is w64h64.
 */
@property (nonatomic) DropboxThumbnailSize size;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path format:(DropboxThumbnailFormat)format size:(DropboxThumbnailSize)size;

@end
