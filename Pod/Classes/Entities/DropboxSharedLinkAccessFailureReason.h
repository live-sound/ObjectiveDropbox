//
//  DropboxSharedLinkAccessFailureReason.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

/**
 The value will be one of the following datatypes. New values may be introduced as our API evolves.
 */
typedef enum : NSUInteger {
    
    /**
     *  User is not logged in.
     */
    DSLAFRLoginRequired,
    
    /**
     *  User's email is not verified.
     */
    DSLAFREmailVerifyRequired,
    
    /**
     *  The link is password protected.

     */
    DSLAFRPasswordRequired,
    
    /**
     *  Access is allowed for team members only.
     */
    DSLAFRTeamOnly,
    
    /**
     *  Access is allowed for the shared link's owner only.
     */
    DSLAFROwnerOnly,
    DSLAFRNotSet
} DropboxSharedLinkAccessFailureReason;