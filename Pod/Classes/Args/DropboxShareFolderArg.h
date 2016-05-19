//
//  DropboxShareFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberPolicy.h"
#import "DropboxAclUpdatePolicy.h"
#import "DropboxSharedLinkPolicy.h"

@interface DropboxShareFolderArg : NSObject

/**
 *  The path to the folder to share. If it does not exist, then a new one is created.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  Who can be a member of this shared folder. Only applicable if the current user is on a team. The default for this union is anyone.
 */
@property (nonatomic) DropboxMemberPolicy memberPolicy;

/**
 *  Who can add and remove members of this shared folder. The default for this union is owner.
 */
@property (nonatomic) DropboxAclUpdatePolicy aclUpdatePolicy;

/**
 *  The policy to apply to shared links created for content inside this shared folder. The current user must be on a team to set this policy to SharedLinkPolicy.members. The default for this union is anyone.
 */
@property (nonatomic) DropboxSharedLinkPolicy sharedLinkPolicy;

/**
 *  Whether to force the share to happen asynchronously. The default for this field is False.
 */
@property (nonatomic) BOOL forceAsync;


- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path memberPolicy:(DropboxMemberPolicy)memberPolicy aclUpdatePolicy:(DropboxAclUpdatePolicy)aclUpdatePolicy sharedLinkPolicy:(DropboxSharedLinkPolicy)sharedLinkPolicy forceAsync:(BOOL)forceAsync;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path;

@end
