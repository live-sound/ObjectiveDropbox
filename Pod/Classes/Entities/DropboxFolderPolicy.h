//
//  DropboxFolderPolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberPolicy.h"
#import "DropboxAclUpdatePolicy.h"
#import "DropboxSharedLinkPolicy.h"

/**
 *  A set of policies governing membership and privileges for a shared folder.
 */
@interface DropboxFolderPolicy : NSObject

/**
 *  Who can add and remove members from this shared folder.
 */
@property (nonatomic) DropboxAclUpdatePolicy aclUpdatePolicy;

/**
 *  Who links can be shared with.
 */
@property (nonatomic) DropboxSharedLinkPolicy sharedLinkPolicy;

/**
 *  Who can be a member of this shared folder, as set on the folder itself. The effective policy may differ from this value if the team-wide policy is more restrictive. Present only if the folder is owned by a team.
 */
@property (nonatomic) DropboxMemberPolicy memberPolicy;

/**
 *  Who can be a member of this shared folder, taking into account both the folder and the team-wide policy. This value may differ from that of member_policy if the team-wide policy is more restrictive than the folder policy. Present only if the folder is owned by a team.
 */
@property (nonatomic) DropboxMemberPolicy resolvedMemberPolicy;

@end
