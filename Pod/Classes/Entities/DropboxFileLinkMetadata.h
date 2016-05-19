//
//  DropboxFileLinkMetadata.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxSharedLinkMetadata.h"

/**
 *  The metadata of a file shared link
 */
@interface DropboxFileLinkMetadata : DropboxSharedLinkMetadata

/**
 *  The modification time set by the desktop client when the file was added to Dropbox. Since this time is not verified (the Dropbox server stores whatever the desktop client sends up), this should only be used for display purposes (such as sorting) and not, for example, to determine if a file has changed or not.
 */
@property (nonatomic, nonnull) NSDate *clientModified;

/**
 *   The last time the file was modified on Dropbox.
 */
@property (nonatomic, nonnull) NSDate *serverModified;

/**
 *  A unique identifier for the current revision of a file. This field is the same rev as elsewhere in the API and can be used to detect changes and avoid conflicts.
 */
@property (nonatomic, nonnull) NSString *rev;

/**
 *  The file size in bytes.
 */
@property (nonatomic) UInt64 size;

@end
