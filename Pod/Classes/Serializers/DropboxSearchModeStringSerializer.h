//
//  DropboxSearchModeDictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSearchMode.h"
#import "EnumToStringSerializer.h"

@interface DropboxSearchModeStringSerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxSearchMode)searchMode;

@end
