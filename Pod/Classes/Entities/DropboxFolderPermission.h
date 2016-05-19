//
//  DropboxFolderPermission.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFolderAction.h"
#import "DropboxPermissionDeniedReason.h"

/**
 *  Whether the user is allowed to take the action on the shared folder.
 */
@interface DropboxFolderPermission : NSObject

/**
 *  The action that the user may wish to take on the folder.
 */
@property (nonatomic) DropboxFolderAction action;

/**
 *  YES if the user is allowed to take the action.
 */
@property (nonatomic) BOOL allow;

/**
 *  The reason why the user is denied the permission. Not present if the action is allowed, or if no reason is available.
 */
@property (nonatomic) DropboxPermissionDeniedReason reason;

@end
