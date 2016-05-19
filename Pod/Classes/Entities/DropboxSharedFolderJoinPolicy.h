//
//  DropboxSharedFolderJoinPolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

/**
 Policy governing which shared folders a team member can join. This datatype comes from an imported namespace originally defined in the team_policies namespace.
 */
typedef enum : NSUInteger {
    
    /**
     *  Team members can only join folders shared by teammates.
     */
    DSFJPFromTeamOnly,
    /**
     *  Team members can join any shared folder, including those shared by users outside the team.
     */
    DSFJPFromAnyone,
    DSFJPNotSet
} DropboxSharedFolderJoinPolicy;