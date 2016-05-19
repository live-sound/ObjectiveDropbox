//
//  DropboxGroupInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxGroupType.h"

/**
 *  The information about a group. Groups is a way to manage a list of users who need same access permission to the shared folder.
 */
@interface DropboxGroupInfo : NSObject

@property (nonatomic, nonnull) NSString *groupName;
@property (nonatomic, nonnull) NSString *groupID;

/**
 *  The type of group.
 */
@property (nonatomic) DropboxGroupType groupType;

/**
 *  If the group is owned by the current user's team.
 */
@property (nonatomic) BOOL sameTeam;

/**
 *  External ID of group. This is an arbitrary ID that an admin can attach to a group. This field is optional.
 */
@property (nonatomic, nullable) NSString *groupExternalID;

/**
 *  The number of members in the group. This field is optional.
 */
@property (nonatomic) long memberCount;

@end
