//
//  DropboxFileSystemSharingInfo.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface DropboxFileSystemSharingInfo : NSObject

/**
 *  True if the file or folder is inside a read-only shared folder.
 */
@property (nonatomic) BOOL readOnly;

/**
 *  ID of shared folder that holds this file.
 */
@property (nonatomic, nonnull) NSString *parentSharedFolderID;


@end
