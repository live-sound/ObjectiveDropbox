//
//  DropboxListFoldersArgs.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFolderAction.h"

@interface DropboxListFoldersArgs : NSObject

/**
 *  The maximum number of results to return per request. The default for this field is 1000.
 */
@property (nonatomic) UInt32 limit;

/**
 *  Folder actions to query. This field is optional.
 */
@property (nonatomic, nullable) NSArray<NSNumber *> *actions;


- (nonnull instancetype)initWithLimit:(UInt32)limit actions:(DropboxFolderAction)action1, ... NS_REQUIRES_NIL_TERMINATION;

- (nonnull instancetype)initWithLimit:(UInt32)limit;

@end
