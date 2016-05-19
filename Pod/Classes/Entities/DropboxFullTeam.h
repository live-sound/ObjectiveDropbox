//
//  DropboxFullTeam.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxTeamSharingPolicies.h"

/**
 *  Detailed information about a team.
 */
@interface DropboxFullTeam : NSObject

/**
 *  The team's unique ID.
 */
@property (nonatomic, nonnull) NSString *ID;

/**
 *  The name of the team.
 */
@property (nonatomic, nonnull) NSString *name;

/**
 *  Team policies governing sharing.
 */
@property (nonatomic, nonnull) DropboxTeamSharingPolicies *sharingPolicies;

@end
