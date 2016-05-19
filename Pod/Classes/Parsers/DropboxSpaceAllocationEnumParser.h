//
//  DropboxSpaceAllocationEnumParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSpaceAllocationEnum.h"

@interface DropboxSpaceAllocationEnumParser : NSObject

+ (DropboxSpaceAllocationEnum)spaceAllocationFromString:(NSString * _Nonnull)string;

@end
