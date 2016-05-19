//
//  DropboxPermissionDeniedReason.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

/**
 Possible reasons the user is denied a permission. The value will be one of the following datatypes.
 */
typedef enum : NSUInteger {
    
    /**
     *  User is not on the same team as the folder owner.
     */
    DPDRUserNotSameTeamAsOwner,
    
    /**
     *  User is prohibited by the owner from taking the action.
     */
    DPDRUserNotAllowedByOwner,
    
    /**
     *  Target is indirectly a member of the folder, for example by being part of a group.
     */
    DPDRTargetIsIndirectMember,
    
    /**
     *  Target is the owner of the folder.
     */
    DPDRTargetIsOwner,
    
    /**
     *  Target is the user itself.
     */
    DPDRTargetIsSelf,
    
    /**
     *  Target is not an active member of the team.
     */
    DPDRTargetNotActive,
    DPDRNotSet
} DropboxPermissionDeniedReason;