//
//  DropboxSharedFolderMetadata.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAccessLevel.h"
#import "DropboxFolderPolicy.h"
#import "DropboxTeam.h"
#import "DropboxFolderPermission.h"


/**
 *  The metadata which includes basic information about the shared folder.
 */
@interface DropboxSharedFolderMetadata : NSObject

/**
 *   The current user's access level for this shared folder.
 */
@property (nonatomic) DropboxAccessLevel accessType;

/**
 *  Whether this folder is a team folder.
 */
@property (nonatomic) BOOL isTeamFolder;

/**
 *  Policies governing this shared folder.
 */
@property (nonatomic, nonnull) DropboxFolderPolicy *policy;

/**
 *  The name of the this shared folder.
 */
@property (nonnull, nonatomic) NSString *name;

/**
 *  The ID of the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  Timestamp indicating when the current user was invited to this shared folder.
 */
@property (nonatomic, nonnull) NSDate *timeInvited;

/**
 *  The team that owns the folder. This field is not present if the folder is not owned by a team. This field is optional.
 */
@property (nonatomic, nullable) DropboxTeam *ownerTeam;

/**
 *  The ID of the parent shared folder. This field is present only if the folder is contained within another shared folder. This field is optional.
 */
@property (nonatomic, nullable) NSString *parentSharedFolderID;

/**
 *   The lower-cased full path of this shared folder. Absent for unmounted folders. This field is optional.
 */
@property (nonatomic, nullable) NSString *pathLower;

/**
 *  Actions the current user may perform on the folder and its contents. The set of permissions corresponds to the FolderActions in the request. This field is optional.
 */
@property (nonatomic, nullable) NSArray<DropboxFolderPermission *> *permissions;

@end
