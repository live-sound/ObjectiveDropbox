//
//  DropboxUpdateFolderPolicyArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberPolicy.h"
#import "DropboxAclUpdatePolicy.h"
#import "DropboxSharedLinkPolicy.h"

/**
 *  If any of the policy's are unset, then they retain their current setting.
 */
@interface DropboxUpdateFolderPolicyArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  Who can be a member of this shared folder. Only applicable if the current user is on a team. This field is optional.
 */
@property (nonatomic) DropboxMemberPolicy memberPolicy;

/**
 *  Who can add and remove members of this shared folder. This field is optional.
 */
@property (nonatomic) DropboxAclUpdatePolicy aclUpdatePolicy;

/**
 *  The policy to apply to shared links created for content inside this shared folder. The current user must be on a team to set this policy to SharedLinkPolicy.members. This field is optional.
 */
@property (nonatomic) DropboxSharedLinkPolicy sharedLinkPolicy;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID memberPolicy:(DropboxMemberPolicy)memberPolicy aclUpdatePolicy:(DropboxAclUpdatePolicy)aclUpdatePolicy sharedLinkPolicy:(DropboxSharedLinkPolicy)sharedLinkPolicy;
- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID;

@end
