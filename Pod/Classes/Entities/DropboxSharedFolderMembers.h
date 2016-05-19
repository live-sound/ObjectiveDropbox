//
//  DropboxSharedFolderMembers.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUserMembershipInfo.h"
#import "DropboxGroupMembershipInfo.h"
#import "DropboxInviteeMembershipInfo.h"

/**
 *  Shared folder user and group membership.
 */
@interface DropboxSharedFolderMembers : NSObject

/**
 *  The list of user members of the shared folder.
 */
@property (nonatomic, nonnull) NSArray<DropboxUserMembershipInfo *> *users;

/**
 *  The list of group members of the shared folder.
 */
@property (nonatomic, nonnull) NSArray<DropboxGroupMembershipInfo *> *groups;

/**
 *  The list of invitees to the shared folder.
 */
@property (nonatomic, nonnull) NSArray<DropboxInviteeMembershipInfo *> *invitees;

/**
 *  Present if there are additional shared folder members that have not been returned yet. Pass the cursor into listFolderMembersContinue to list additional members. This field is optional.
 */
@property (nonatomic, nullable) NSString *cursor;

@end
