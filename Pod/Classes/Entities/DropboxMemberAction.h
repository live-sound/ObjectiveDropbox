//
//  DropboxMemberAction.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

/**
 Actions that may be taken on members of a shared folder. The value will be one of the following datatypes. New values may be introduced as our API evolves.
 */
typedef enum : NSUInteger {
    
    /**
     *  Make the member an editor of the folder.
     */
    DMAMakeEditor,
    
    /**
     *  Make the member an owner of the folder.

     */
    DMAMakeOwner,
    
    /**
     *  Make the member a viewer of the folder.
     */
    DMAMakeViewer,
    
    /**
     *  Remove the member from the folder. 
     */
    DMARemove,
    DMANotSet
} DropboxMemberAction;