//
//  DropboxGroupType.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

/**
 The group type determines how a group is created and managed. This datatype comes from an imported namespace originally defined in the team namespace. The value will be one of the following datatypes. New values may be introduced as our API evolves.
 */
typedef enum : NSUInteger {
    /**
     *  A group to which team members are automatically added. Applicable to team folders only.
     */
    DGTTeam,
    
    /**
     *  A group is created and managed by a user.
     */
    DGTUserManaged,
    DGTNotSet
} DropboxGroupType;