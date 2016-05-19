//
//  DropboxTeamMemberInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxTeam.h"

/**
 *  Information about a team member.
 */
@interface DropboxTeamMemberInfo : NSObject

/**
 *  Information about the member's team
 */
@property (nonatomic, nonnull) DropboxTeam *teamInfo;

/**
 *  The display name of the user.
 */
@property (nonatomic, nonnull) NSString *displayName;

/**
 *  ID of user as a member of a team. This field will only be present if the member is in the same team as current user. This field is optional.
 */
@property (nonatomic, nullable) NSString *memberID;

@end
