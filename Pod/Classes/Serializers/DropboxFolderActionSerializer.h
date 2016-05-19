//
//  DropboxFolderActionDictionarySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFolderAction.h"
#import "EnumToStringSerializer.h"

@interface DropboxFolderActionSerializer : NSObject <EnumToStringSerializer>

+ (NSDictionary * _Nonnull)dictionaryFromFolderAction:(DropboxFolderAction)action;
+ (NSString * _Nullable)stringFromEnum:(DropboxFolderAction)action;

@end
