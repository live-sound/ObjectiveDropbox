//
//  DropboxListFoldersResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderMetadata.h"

/**
 *  Result for listFolders or listMountableFolders, depending on which endpoint was requested.
 Unmounted shared folders can be identified by the absence of entry.pathLower.
 */
@interface DropboxListFoldersResult : NSObject

/**
 *  List of all shared folders the authenticated user has access to.
 */
@property (nonatomic, nonnull) NSArray<DropboxSharedFolderMetadata *> *entries;

/**
 *  Present if there are additional shared folders that have not been returned yet. Pass the cursor into the corresponding continue endpoint (either listFoldersContinue or listMountableFoldersContinue) to list additional folders. This field is optional.
 */
@property (nonatomic, nullable) NSString *cursor;

@end
