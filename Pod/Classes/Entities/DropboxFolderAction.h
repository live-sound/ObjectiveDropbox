
//
//  DropboxFolderAction.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

/**
 Actions that may be taken on shared folders. The value will be one of the following datatypes.
 */
typedef enum : NSUInteger {
    
    /**
     *  Change folder options, such as who can be invited to join the folder.
     */
    DFAChangeOptions,
    
    /**
     *   Change or edit contents of the folder.
     */
    DFAEditContents,
    
    /**
     *  Invite a user or group to join the folder with read and write permission.
     */
    DFAInviteEditor,
    
    /**
     *  Invite a user or group to join the folder with read permission.
     */
    DFAInviteViewer,
    
    /**
     *  Relinquish one's own membership in the folder.
     */
    DFARelinquishMembership,
    
    /**
     *  Unmount the folder.
     */
    DFAUnmount,
    
    /**
     *  Stop sharing this folder.
     */
    DFAUnshare,
    
    /**
     *  Keep a copy of the contents upon leaving or being kicked from the folder.
     */
    DFALeaveACopy,
    DFANotSet
} DropboxFolderAction;