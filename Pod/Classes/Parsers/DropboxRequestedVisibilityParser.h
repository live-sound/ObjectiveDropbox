//
//  DropboxRequestedVisibilityParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRequestedVisibility.h"

@interface DropboxRequestedVisibilityParser : NSObject

+ (DropboxRequestedVisibility)requestedVisibilityFromString:(NSString * _Nonnull)string;
+ (DropboxRequestedVisibility)requestedVisibilityFromDictionary:(NSDictionary * _Nonnull)dic;

@end
