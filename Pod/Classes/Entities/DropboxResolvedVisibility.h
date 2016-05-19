
//
//  DropboxResolvedVisibility.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//


/**
 The actual access permissions values of shared links after taking into account user preferences and the team and shared folder settings. Check the DropboxRequestedVisibility for more info on the possible visibility values that can be set by the shared link's owner.
 */
typedef enum : NSUInteger {
    
    /**
     *  Anyone who has received the link can access it. No login required.
     */
    DResolvedVisibilityPublic,
    
    /**
     *  Only members of the same team can access the link. Login is required.
     */
    DResolvedVisibilityTeamOnly,
    
    /**
     *  A link-specific password is required to access the link. Login is not required.
     */
    DResolvedVisibilityPassword,
    
    /**
     *  Only members of the same team who have the link-specific password can access the link. Login is required.
     */
    DResolvedVisibilityTeamAndPassword,
    
    /**
     *  Only members of the shared folder containing the linked file can access the link. Login is required. 
     */
    DResolvedVisibilitySharedFolderOnly,
    DResolvedVisibilityNotSet
} DropboxResolvedVisibility;