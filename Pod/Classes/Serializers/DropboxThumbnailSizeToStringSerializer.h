//
//  DropboxThumbnailSizeToStringSerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxThumbnailSize.h"
#import "EnumToStringSerializer.h"

@interface DropboxThumbnailSizeToStringSerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxThumbnailSize)size;

@end
