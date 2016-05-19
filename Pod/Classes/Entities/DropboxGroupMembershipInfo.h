//
//  DropboxGroupMembershipInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxGroupInfo.h"
#import "DropboxBaseMembershipInfo.h"

/**
 *  The information about a group member of the shared folder.
 */
@interface DropboxGroupMembershipInfo : DropboxBaseMembershipInfo

/**
 *  The information about the membership group.
 */
@property (nonatomic, nonnull) DropboxGroupInfo *group;

@end
