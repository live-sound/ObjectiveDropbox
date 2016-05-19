
//
//  DropboxAccessLevel.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#ifndef DropboxAccessLevel_h
#define DropboxAccessLevel_h

/**
 Defines the access levels for collaborators. The value will be one of the following datatypes. New values may be introduced as our API evolves.
 */
typedef enum : NSUInteger {
    /**
     *  The collaborator is the owner of the shared folder. Owners can view and edit the shared folder as well as set the folder's policies using updateFolderPolicy.
     */
    DALOwner,
    
    /**
     *  The collaborator can both view and edit the shared folder.
     */
    DALEditor,
    
    /**
     *  The collaborator can only view the shared folder.
     */
    DALViewer,
    DALNotSet
} DropboxAccessLevel;

#endif /* DropboxAccessLevel_h */
