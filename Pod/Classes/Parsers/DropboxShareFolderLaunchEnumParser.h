//
//  DropboxShareFolderLaunchEnumParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxShareFolderLaunchEnum.h"

@interface DropboxShareFolderLaunchEnumParser : NSObject

+ (DropboxShareFolderLaunchEnum)enumFromString:(NSString * _Nonnull)string;

@end
