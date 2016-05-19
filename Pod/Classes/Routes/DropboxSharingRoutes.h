//
//  DropboxSharingRoutes.h
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRoutes.h"
#import "DropboxAddFolderMemberArg.h"
#import "DropboxPollArg.h"
#import "DropboxJobStatusResult.h"
#import "DropboxShareFolderJobStatusResult.h"
#import "DropboxSharedLinkMetadata.h"
#import "DropboxCreateSharedLinkWithSettingsArg.h"
#import "DropboxGetMetadataArgs.h"
#import "DropboxGetSharedLinkMetadataArg.h"
#import "DropboxListFolderMembersArgs.h"
#import "DropboxSharedFolderMembers.h"
#import "DropboxListFolderMembersContinueArg.h"
#import "DropboxListFoldersArgs.h"
#import "DropboxListFoldersResult.h"
#import "DropboxListFoldersContinueArg.h"
#import "DropboxListSharedLinksArg.h"
#import "DropboxListSharedLinksResult.h"
#import "DropboxModifySharedLinkSettingsArgs.h"
#import "DropboxMountFolderArg.h"
#import "DropboxRelinquishFolderMembershipArg.h"
#import "DropboxSharedFolderMetadata.h"
#import "DropboxRemoveFolderMemberArg.h"
#import "DropboxLaunchEmptyResult.h"
#import "DropboxRevokeSharedLinkArg.h"
#import "DropboxShareFolderArg.h"
#import "DropboxShareFolderLaunch.h"
#import "DropboxTransferFolderArg.h"
#import "DropboxUnmountFolderArg.h"
#import "DropboxUnshareFolderArg.h"
#import "DropboxUpdateFolderMemberArg.h"
#import "DropboxUpdateFolderPolicyArg.h"
#import "DropboxSharedFolderMetadata.h"
#import "DropboxUrlSessionHandlers.h"
#import "DropboxDownloadTask.h"

@interface DropboxSharingRoutes : DropboxRoutes

/**
 *  Allows an owner or editor (if the ACL update policy allows) of a shared folder to add another member.
 For the new member to get access to all the functionality for this folder, you will need to call mountFolder on their behalf.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)addFolderMember:(DropboxAddFolderMemberArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns the status of an asynchronous job.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)checkJobStatus:(DropboxPollArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxJobStatusResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns the status of an asynchronous job for sharing a folder.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)checkShareJobStatus:(DropboxPollArg * _Nonnull)arg success:(void(^_Nullable)(DropboxShareFolderJobStatusResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Create a shared link with custom settings. If no settings are given then the default visibility is RequestedVisibility.public (The resolved visibility, though, may depend on other aspects such as team and shared folder settings).
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)createSharedLinkWithSettings:(DropboxCreateSharedLinkWithSettingsArg * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedLinkMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns shared folder metadata by its folder ID.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)getFolderMetadata:(DropboxGetMetadataArgs * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedFolderMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Download the shared link's file from a user's Dropbox.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (DropboxDownloadTask * _Nonnull)getSharedLinkFile:(DropboxGetSharedLinkMetadataArg * _Nonnull)arg destUrl:(NSURL * _Nonnull)destFileUrl progress:(DownloadTaskProgressHandler _Nullable)progressBlock success:(void(^_Nullable)(DropboxSharedLinkMetadata * _Nonnull metadata))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get the shared link's metadata.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)getSharedLinkMetadata:(DropboxGetSharedLinkMetadataArg * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedLinkMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns shared folder membership by its folder ID.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)listFolderMembers:(DropboxListFolderMembersArgs * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedFolderMembers * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Once a cursor has been retrieved from list_folder_members, use this to paginate through all shared folder members.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)listFolderMembersContinue:(DropboxListFolderMembersContinueArg * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedFolderMembers * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Return the list of all shared folders the current user has access to.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)listFolders:(DropboxListFoldersArgs * _Nonnull)arg success:(void(^_Nullable)(DropboxListFoldersResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Once a cursor has been retrieved from list_folders, use this to paginate through all shared folders. The cursor must come from a previous call to list_folders or list_folders/continue.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock       
 */
- (void)listFoldersContinue:(DropboxListFoldersContinueArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFoldersResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Return the list of all shared folders the current user can mount or unmount.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)listMountableFolders:(DropboxListFoldersArgs * _Nonnull)arg success:(void(^_Nullable)(DropboxListFoldersResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Once a cursor has been retrieved from list_mountable_folders, use this to paginate through all mountable shared folders. The cursor must come from a previous call to listMountableFolders or listMountableFoldersContinue. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listMountableFoldersContinue:(DropboxListFoldersContinueArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFoldersResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  List shared links of this user.
 If no path is given or the path is empty, returns a list of all shared links for the current user.
 If a non-empty path is given, returns a list of all shared links that allow access to the given path - direct links to the given path and links to parent folders of the given path. Links to parent folders can be suppressed by setting direct_only to YES.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)listSharedLinks:(DropboxListSharedLinksArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListSharedLinksResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Modify the shared link's settings.
 If the requested visibility conflict with the shared links policy of the team or the shared folder (in case the linked file is part of a shared folder) then the LinkPermissions.resolvedVisibility of the returned SharedLinkMetadata will reflect the actual visibility of the shared link and the LinkPermissions.requestedVisibility will reflect the requested visibility.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)modifySharedLinkSettings:(DropboxModifySharedLinkSettingsArgs * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedLinkMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  The current user mounts the designated folder.
 Mount a shared folder for a user after they have been added as a member. Once mounted, the shared folder will appear in their Dropbox. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)mountFolder:(DropboxMountFolderArg * _Nonnull)arg success:(void(^_Nullable)(DropboxSharedFolderMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  The current user relinquishes their membership in the designated shared folder and will no longer have access to the folder. A folder owner cannot relinquish membership in their own folder. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)relinquishFolderMembership:(DropboxRelinquishFolderMembershipArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Allows an owner or editor (if the ACL update policy allows) of a shared folder to remove another member. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)removeFolderMember:(DropboxRemoveFolderMemberArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxLaunchEmptyResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Revoke a shared link.
 Note that even after revoking a shared link to a file, the file may be accessible if there are shared links leading to any of the file parent folders. To list all shared links that enable access to a specific file, you can use the listSharedLinks with the file as the ListSharedLinksArg.path argument.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)revokeSharedLink:(DropboxRevokeSharedLinkArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Share a folder with collaborators. Most sharing will be completed synchronously. Large folders will be completed asynchronously. To make testing the async case repeatable, set `ShareFolderArg.forceAsync`. If a DSFLAsyncJobID is returned, you'll need to call checkShareJobStatus until the action completes to get the metadata for the folder. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)shareFolder:(DropboxShareFolderArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxShareFolderLaunch * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Transfer ownership of a shared folder to a member of the shared folder.
 User must have AccessLevel.owner access to the shared folder to perform a transfer.
 Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)transferFolder:(DropboxTransferFolderArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  The current user unmounts the designated folder. They can re-mount the folder at a later time using mount_folder. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)unmountFolder:(DropboxUnmountFolderArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Allows a shared folder owner to unshare the folder. You'll need to call checkJobStatus to determine if the action has completed successfully. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)unshareFolder:(DropboxUnshareFolderArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxLaunchEmptyResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Allows an owner or editor of a shared folder to update another member's permissions. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)updateFolderMember:(DropboxUpdateFolderMemberArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Update the sharing policies for a shared folder. User must have AccessLevel.owner access to the shared folder to update its policies. Apps must have full Dropbox access to use this endpoint.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)updateFolderPolicy:(DropboxUpdateFolderPolicyArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxSharedFolderMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

@end
