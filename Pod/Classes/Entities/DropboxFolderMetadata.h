//
//  DropboxFolderMetadata.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMetadata.h"
#import "DropboxFolderSharingInfo.h"

@interface DropboxFolderMetadata : DropboxMetadata

/**
 *  A unique identifier for the file/folder.
 */
@property (nonatomic, nonnull) NSString *id;


/**
 *  Set if the folder is contained in a shared folder or is a shared folder mount point. This field is optional.
 */
@property (nonatomic, nullable) DropboxFolderSharingInfo *sharingInfo;

@end
