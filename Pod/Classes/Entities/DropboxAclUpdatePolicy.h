//
//  DropboxAclUpdatePolicy.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

/**
 Policy governing who can change a shared folder's access control list (ACL). In other words, who can add, remove, or change the privileges of members.
 */
typedef enum : NSUInteger {
    /**
     *  Only the owner can update the ACL.
     */
    DAUPOwner,
    
    /**
     *  Any editor can update the ACL. This may be further restricted to editors on the same team. 
     */
    DAUPEditors,
    DAUPNotSet
} DropboxAclUpdatePolicy;