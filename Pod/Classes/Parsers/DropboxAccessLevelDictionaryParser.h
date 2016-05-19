//
//  DropboxAccessLevelDictionaryParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAccessLevel.h"

@interface DropboxAccessLevelDictionaryParser : NSObject

+ (DropboxAccessLevel)accessLevelFromDictionary:(NSDictionary * _Nonnull)dic;

@end
