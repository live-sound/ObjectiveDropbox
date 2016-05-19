//
//  DropboxBasicAccount.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxName.h"

/**
 *  Basic information about any account.
 */
@interface DropboxBasicAccount : NSObject

/**
 *  The user's unique Dropbox ID.
 */
@property (nonatomic, nonnull) NSString *accountID;

/**
 *  Details of a user's name.
 */
@property (nonatomic, nonnull) DropboxName *name;

/**
 *  The user's e-mail address. Do not rely on this without checking the email_verified field. Even then, it's possible that the user has since lost access to their e-mail.
 */
@property (nonatomic, nonnull) NSString *email;

/**
 *  Whether the user has verified their e-mail address.
 */
@property (nonatomic) BOOL emailVerified;

/**
 *  Whether the user has been disabled.
 */
@property (nonatomic) BOOL disabled;

/**
 *  Whether this user is a teammate of the current user. If this account is the current user's account, then this will be true.
 */
@property (nonatomic) BOOL isTeammate;

/**
 *  URL for the photo representing the user, if one is set. This field is optional.
 */
@property (nonatomic, nullable) NSString *profilePhotoUrl;

/**
 *  The user's unique team member id. This field will only be present if the user is part of a team and is_teammate is true. This field is optional.
 */
@property (nonatomic, nullable) NSString *teamMemberID;

@end
