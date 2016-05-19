//
//  DropboxRemoveFolderMemberArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberSelector.h"

@interface DropboxRemoveFolderMemberArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  The member to remove from the folder.
 */
@property (nonatomic, nonnull) DropboxMemberSelector *member;

/**
 *  If YES, the removed user will keep their copy of the folder after it's unshared, assuming it was mounted. Otherwise, it will be removed from their Dropbox. Also, this must be set to NO when kicking a group.
 */
@property (nonatomic) BOOL leaveACopy;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID member:(DropboxMemberSelector * _Nonnull)member leaveACopy:(BOOL)leaveACopy;

@end
