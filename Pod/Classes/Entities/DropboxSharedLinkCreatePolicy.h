
//
//  DropboxSharedLinkCreatePolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

/**
 Policy governing the visibility of newly created shared links. This datatype comes from an imported namespace originally defined in the team_policies namespace.
 */
typedef enum : NSUInteger {
    /**
     *  By default, anyone can access newly created shared links. No login will be required to access the shared links unless overridden.
     */
    DSLCPDefaultPublic,
    
    /**
     *  By default, only members of the same team can access newly created shared links. Login will be required to access the shared links unless overridden.
     */
    DSLCPDefaultTeamOnly,
    
    /**
     *  Only members of the same team can access newly created shared links. Login will be required to access the shared links. 
     */
    DSLCPTeamOnly,
    DSLCPNotSet
} DropboxSharedLinkCreatePolicy;