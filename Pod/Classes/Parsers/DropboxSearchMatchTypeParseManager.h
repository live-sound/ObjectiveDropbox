//
//  DropboxSearchMatchTypeDictionaryParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSearchMatchType.h"

@interface DropboxSearchMatchTypeParseManager : NSObject

+ (DropboxSearchMatchType)searchMatchTypeFromDictionary:(NSDictionary * _Nonnull)dic;
+ (DropboxSearchMatchType)searchMatchTypeFromString:(NSString * _Nonnull)string;

@end
