//
//  DropboxFileMetadata.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMetadata.h"
#import "DropboxMediaInfo.h"
#import "DropboxFileSharingInfo.h"

@interface DropboxFileMetadata : DropboxMetadata

/**
 *  For files, this is the modification time set by the desktop client when the file was added to Dropbox. Since this time is not verified (the Dropbox server stores whatever the desktop client sends up), this should only be used for display purposes (such as sorting) and not, for example, to determine if a file has changed or not.
 */
@property (nonatomic, nonnull) NSDate *clientModified;

/**
 *  The last time the file was modified on Dropbox.
 */
@property (nonatomic, nonnull) NSDate *serverModified;

/**
 *  A unique identifier for the current revision of a file. This field is the same rev as elsewhere in the API and can be used to detect changes and avoid conflicts.
 */
@property (nonatomic, nonnull) NSString *rev;

/**
 *  The file size in bytes.
 */
@property UInt64 size;

/**
 *  A unique identifier for the file.
 */
@property (nonatomic, nonnull) NSString *id;


/**
 *  Additional information if the file is a photo or video. This field is optional.
 */
@property (nonatomic, nullable) DropboxMediaInfo *mediaInfo;

/**
 *  Set if this file is contained in a shared folder. This field is optional.
 */
@property (nonatomic, nullable) DropboxFileSharingInfo *sharingInfo;

@end
