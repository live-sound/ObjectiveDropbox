//
//  DropboxFolderSharingInfo.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMetadata.h"
#import "DropboxFileSystemSharingInfo.h"

@interface DropboxFolderSharingInfo : DropboxFileSystemSharingInfo

/**
 *  If this folder is a shared folder mount point, the ID of the shared folder mounted at this location. This field is optional. 
 */
@property (nonatomic, nullable) NSString *sharedFolderID;

@end
