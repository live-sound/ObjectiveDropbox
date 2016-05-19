//
//  DropboxRequestedVisibilityDictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRequestedVisibility.h"
#import "EnumToStringSerializer.h"

@interface DropboxRequestedVisibilityStringSerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxRequestedVisibility)visibility;


@end
