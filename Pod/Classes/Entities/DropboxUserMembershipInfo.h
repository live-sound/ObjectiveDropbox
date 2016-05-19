//
//  DropboxUserMembershipInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxBaseMembershipInfo.h"
#import "DropboxUserInfo.h"

/**
 *  The information about a user member of the shared folder.
 */
@interface DropboxUserMembershipInfo : DropboxBaseMembershipInfo

/**
 *  The account information for the membership user.
 */
@property (nonatomic, nonnull) DropboxUserInfo *user;

@end
