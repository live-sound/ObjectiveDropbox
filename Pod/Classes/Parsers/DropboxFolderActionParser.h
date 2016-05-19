//
//  DropboxFolderActionParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFolderAction.h"

@interface DropboxFolderActionParser : NSObject

+ (DropboxFolderAction)folderActionFromString:(NSString * _Nonnull)string;

@end
