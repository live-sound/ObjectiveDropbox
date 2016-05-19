//
//  DropboxInviteeMembershipInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxBaseMembershipInfo.h"
#import "DropboxInviteeInfo.h"
#import "DropboxUserInfo.h"

/**
 *  Information about an invited member of a shared folder.
 */
@interface DropboxInviteeMembershipInfo : DropboxBaseMembershipInfo

/**
 *  Recipient of the invitation.
 */
@property (nonatomic, nonnull) DropboxInviteeInfo *invitee;

/**
 *  The user this invitation is tied to, if available. This field is optional.
 */
@property (nonatomic, nullable) DropboxUserInfo *user;

@end
