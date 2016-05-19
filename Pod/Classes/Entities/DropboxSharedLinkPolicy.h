//
//  DropboxSharedLinkPolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

/**
 Policy governing who can view shared links.
 */
typedef enum : NSUInteger {
    
    /**
     *  Links can be shared with anyone.
     */
    DSLPAnyone,
    
    /**
     *  Links can only be shared among members of the shared folder. 
     */
    DSLPMembers,
    DSLPNotSet
} DropboxSharedLinkPolicy;