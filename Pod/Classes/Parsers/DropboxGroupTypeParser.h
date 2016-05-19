//
//  DropboxGroupTypeParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxGroupType.h"

@interface DropboxGroupTypeParser : NSObject

+ (DropboxGroupType)groupTypeFromString:(NSString * _Nonnull)string;
+ (DropboxGroupType)groupTypeFromDictinary:(NSDictionary * _Nonnull)dic;

@end
