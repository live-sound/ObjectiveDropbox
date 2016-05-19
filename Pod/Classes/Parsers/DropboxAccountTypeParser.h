//
//  DropboxAccountTypeParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAccountType.h"

@interface DropboxAccountTypeParser : NSObject

+ (DropboxAccountType)accountTypeFromString:(NSString * _Nonnull)string;
+ (DropboxAccountType)accountTypeFromDictionary:(NSDictionary * _Nonnull)dic;

@end
