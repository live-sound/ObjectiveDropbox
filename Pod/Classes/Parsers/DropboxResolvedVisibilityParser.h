//
//  DropboxResolvedVisibilityParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxResolvedVisibility.h"

@interface DropboxResolvedVisibilityParser : NSObject

+ (DropboxResolvedVisibility)resolvedVisibilityFromString:(NSString * _Nonnull)string;
+ (DropboxResolvedVisibility)resolvedVisibilityFromDictionary:(NSDictionary * _Nonnull)dic;

@end
