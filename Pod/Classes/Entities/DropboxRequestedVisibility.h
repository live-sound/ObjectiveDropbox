//
//  DropboxRequestedVisibility.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

/**
 The access permission that can be requested by the caller for the shared link. Note that the final resolved visibility of the shared link takes into account other aspects, such as team and shared folder settings.
 */
typedef enum : NSUInteger {
    
    /**
     *  Anyone who has received the link can access it. No login required.
     */
    DRVPublic,
    
    /**
     *  Only members of the same team can access the link. Login is required.
     */
    DRVTeamOnly,
    
    /**
     *  A link-specific password is required to access the link. Login is not required.
     */
    DRVPassword,
    DRVNotSet
} DropboxRequestedVisibility;