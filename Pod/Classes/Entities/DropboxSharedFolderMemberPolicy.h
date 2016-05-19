//
//  DropboxSharedFolderMemberPolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

/**
 Policy governing who can be a member of a folder shared by a team member. This datatype comes from an imported namespace originally defined in the team_policies namespace.
 */
typedef enum : NSUInteger {
    /**
     *  Only a teammate can be a member of a folder shared by a team member.
     */
    DSFMPTeam,
    
    /**
     *  Anyone can be a member of a folder shared by a team member.
     */
    DSFMPAnyone,
    DSFMPNotSet
} DropboxSharedFolderMemberPolicy;