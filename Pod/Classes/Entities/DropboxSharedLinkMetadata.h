//
//  DropboxSharedLinkMetadata.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxLinkPermissions.h"
#import "DropboxTeamMemberInfo.h"

@interface DropboxSharedLinkMetadata : NSObject

/**
 *  URL of the shared link.
 */
@property (nonnull, nonatomic) NSString *url;

/**
 *  The linked file name (including extension). This never contains a slash.
 */
@property (nonatomic, nonnull) NSString *name;

/**
 *  The link's access permissions.
 */
@property (nonatomic, nonnull) DropboxLinkPermissions *linkPermissions;

/**
 *  A unique identifier for the linked file. This field is optional.
 */
@property (nonatomic, nullable) NSString *ID;

/**
 *  Expiration time, if set. By default the link won't expire. This field is optional.
 */
@property (nonatomic, nullable) NSDate *expires;

/**
 *  The lowercased full path in the user's Dropbox. This always starts with a slash. This field will only be present only if the linked file is in the authenticated user's dropbox. This field is optional.
 */
@property (nonatomic, nullable) NSString *pathLower;

/**
 *  The team membership information of the link's owner. This field will only be present if the link's owner is a team member. This field is optional.
 */
@property (nonatomic, nullable) DropboxTeamMemberInfo *teamMemberInfo;

/**
 *  The team information of the content's owner. This field will only be present if the content's owner is a team member and the content's owner team is different from the link's owner team. This field is optional.
 */
@property (nonatomic, nullable) DropboxTeam *contentOwnerTeamInfo;

@end
