//
//  DropboxUpdateFolderMemberArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberSelector.h"
#import "DropboxAccessLevel.h"

@interface DropboxUpdateFolderMemberArg : NSObject

/**
 *   The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  The member of the shared folder to update. Only the MemberSelector.dropboxID may be set at this time.
 */
@property (nonatomic, nonnull) DropboxMemberSelector *member;

/**
 *  The new access level for member. AccessLevel.owner is disallowed.
 */
@property (nonatomic) DropboxAccessLevel accessLevel;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID member:(DropboxMemberSelector * _Nonnull)member accessLevel:(DropboxAccessLevel)accessLevel;

@end
