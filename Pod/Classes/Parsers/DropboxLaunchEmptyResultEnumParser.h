//
//  DropboxLaunchEmptyResultEnumParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxLaunchEmptyResultEnum.h"

@interface DropboxLaunchEmptyResultEnumParser : NSObject

+ (DropboxLaunchEmptyResultEnum)launchEmptyResultFromString:(NSString * _Nonnull)string;

@end
