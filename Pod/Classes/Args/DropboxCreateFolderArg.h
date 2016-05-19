//
//  DropboxCreateFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxCreateFolderArg : NSObject

/**
 *  Path in the user's Dropbox to create. Example: "/Homework/geometry"
 */
@property (nonatomic, nonnull) NSString *path;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path;

@end
