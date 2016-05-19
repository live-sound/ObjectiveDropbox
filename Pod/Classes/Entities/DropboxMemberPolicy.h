//
//  DropboxMemberPolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

/**
 Policy governing who can be a member of a shared folder. Only applicable to folders owned by a user on a team.
 */
typedef enum : NSUInteger {
    /**
     *  Only a teammate can become a member.
     */
    DMPTeam,
    
    /**
     *  Anyone can become a member. 
     */
    DMPAnyone,
    DMPNotSet
} DropboxMemberPolicy;