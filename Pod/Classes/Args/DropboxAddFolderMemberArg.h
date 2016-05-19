//
//  DropboxAddFolderMemberArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAddMember.h"

@interface DropboxAddFolderMemberArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *   The intended list of members to add. Added members will receive invites to join the shared folder.
 */
@property (nonatomic, nonnull) NSArray<DropboxAddMember *> *members;

/**
 *  Whether added members should be notified via email and device notifications of their invite. The default for this field is False.
 */
@property (nonatomic) BOOL quiet;

/**
 *  Optional message to display to added members in their invitation. This field is optional.
 */
@property (nonatomic, nullable) NSString *customMessage;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID members:(NSArray<DropboxAddMember *> * _Nonnull)members quiet:(BOOL)quiet customMessage:(NSString * _Nullable)customMessage;

@end
