//
//  DropboxMemberPermission.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberAction.h"
#import "DropboxPermissionDeniedReason.h"

/**
 *  Whether the user is allowed to take the action on the associated member.
 */
@interface DropboxMemberPermission : NSObject

/**
 *  The action that the user may wish to take on the member.
 */
@property (nonatomic) DropboxMemberAction action;

/**
 *  True if the user is allowed to take the action.
 */
@property (nonatomic) BOOL allow;

/**
 *  The reason why the user is denied the permission. Not present if the action is allowed This field is optional.
 */
@property (nonatomic) DropboxPermissionDeniedReason reason;

@end
