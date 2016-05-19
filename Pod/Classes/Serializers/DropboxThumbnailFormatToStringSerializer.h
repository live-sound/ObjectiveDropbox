//
//  DropboxThumbnailFormatToStringSerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxThumbnailFormat.h"
#import "EnumToStringSerializer.h"

@interface DropboxThumbnailFormatToStringSerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxThumbnailFormat)format;

@end
