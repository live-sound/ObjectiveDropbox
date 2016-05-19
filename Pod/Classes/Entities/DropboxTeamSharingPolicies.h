//
//  DropboxTeamSharingPolicies.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderMemberPolicy.h"
#import "DropboxSharedFolderJoinPolicy.h"
#import "DropboxSharedLinkCreatePolicy.h"

/**
 *  Policies governing sharing within and outside of the team. This datatype comes from an imported namespace originally defined in the team_policies namespace.
 */
@interface DropboxTeamSharingPolicies : NSObject

/**
 *  Who can join folders shared by team members.
 */
@property (nonatomic) DropboxSharedFolderMemberPolicy sharedFolderMemberPolicy;

/**
 *  Which shared folders team members can join.
 */
@property (nonatomic) DropboxSharedFolderJoinPolicy sharedFolderJoinPolicy;

/**
 *  What is the visibility of newly created shared links.
 */
@property (nonatomic) DropboxSharedLinkCreatePolicy sharedLinkCreatePolicy;

@end
