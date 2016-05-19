//
//  DropboxFullAccount.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxName.h"
#import "DropboxAccountType.h"
#import "DropboxFullTeam.h"

/**
 *  Detailed information about the current user's account.
 */
@interface DropboxFullAccount : NSObject

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
 *   Whether the user has verified their e-mail address.
 */
@property (nonatomic) BOOL emailVerified;

/**
 *  Whether the user has been disabled.

 */
@property (nonatomic) BOOL disabled;

/**
 *  The language that the user specified. Locale tags will be IETF language tags.
 */
@property (nonatomic, nonnull) NSString *locale;

/**
 *  The user's referral link.
 */
@property (nonatomic, nonnull) NSString *referralLink;

/**
 *  Whether the user has a personal and work account. If the current account is personal, then team will always be None, but is_paired will indicate if a work account is linked.
 */
@property (nonatomic) BOOL isPaired;

/**
 *  What type of account this user has.
 */
@property (nonatomic) DropboxAccountType accountType;

/**
 *  URL for the photo representing the user, if one is set. This field is optional.
 */
@property (nonatomic, nullable) NSString *profilePhotoUrl;

/**
 *  The user's two-letter country code, if available. Country codes are based on ISO 3166-1. This field is optional.
 */
@property (nonatomic, nullable) NSString *country;

/**
 *  If this account is a member of a team, information about that team. This field is optional.
 */
@property (nonatomic, nullable) DropboxFullTeam *team;

/**
 *  This account's unique team member id. This field will only be present if team is present. This field is optional.
 */
@property (nonatomic, nullable) NSString *teamMemberID;

@end
