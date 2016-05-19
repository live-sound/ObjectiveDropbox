//
//  DropboxUserInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 *  Basic information about a user. Use users.getAccount and users.getAccountBatch to obtain more detailed information.
 */
@interface DropboxUserInfo : NSObject

/**
 *  The account ID of the user.
 */
@property (nonatomic, nonnull) NSString *accountID;

/**
 *  If the user is in the same team as current user.
 */
@property (nonatomic) BOOL sameTeam;

/**
 *  The team member ID of the shared folder member. Only present if same_team is true. This field is optional.
 */
@property (nonatomic, nullable) NSString *teamMemberID;

@end
