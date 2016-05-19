//
//  DropboxGetMetadataArgs.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFolderAction.h"

@interface DropboxGetMetadataArgs : NSObject

/**
 *   The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  Folder actions to query. This field is optional.
 */
@property (nonatomic, nullable) NSArray<NSNumber *> *actions;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID actions:(DropboxFolderAction)action1, ... NS_REQUIRES_NIL_TERMINATION;

- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID;

@end
