//
//  DropboxAccessLevelDictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAccessLevel.h"
#import "EnumToStringSerializer.h"

@interface DropboxAccessLevelDictionarySerializer : NSObject <EnumToStringSerializer>

+ (NSDictionary * _Nonnull)dictionaryFromAccessLevel:(DropboxAccessLevel)accessLevel;
+ (NSString * _Nullable)stringFromEnum:(DropboxAccessLevel)accessLevel;

@end
