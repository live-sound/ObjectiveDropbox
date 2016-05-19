//
//  DropboxBaseMembershipInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAccessLevel.h"
#import "DropboxMemberPermission.h"

@interface DropboxBaseMembershipInfo : NSObject

/**
 *  The access type for this memb
 */
@property (nonatomic) DropboxAccessLevel accessType;

/**
 *  The permissions that requesting user has on this member. The set of permissions corresponds to the MemberActions in the request. This field is optional.
 */
@property (nonatomic, nullable) NSArray<DropboxMemberPermission *> *permissions;

/**
 *  Suggested name initials for a member. This field is optional.
 */
@property (nonatomic, nullable) NSString *initials;

/**
 *  YES if the member's access to the file is inherited from a parent folder. The default for this field is NO.
 */
@property (nonatomic) BOOL isInherited;

@end
