//
//  DropboxLinkFolderMembersArgs.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberAction.h"

@interface DropboxListFolderMembersArgs : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  Member actions to query. This field is optional.
 */
@property (nonatomic, nullable) NSArray<NSNumber *> *actions;

/**
 *  The maximum number of results that include members, groups and invitees to return per request. The default for this field is 1000.
 */
@property (nonatomic) UInt32 limit;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID limit:(UInt32)limit actions:(DropboxMemberAction)action1, ... NS_REQUIRES_NIL_TERMINATION;
- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID limit:(UInt32)limit;

@end
