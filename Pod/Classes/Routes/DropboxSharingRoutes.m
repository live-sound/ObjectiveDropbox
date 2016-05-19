//
//  DropboxSharingRoutes.m
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import "DropboxSharingRoutes.h"
#import "DropboxAddFolderMemberArg+DictionarySerializer.h"
#import "DropboxJobStatusResult+DictionaryParser.h"
#import "DropboxPollArg+DictionarySerializer.h"
#import "DropboxShareFolderJobStatusResult+DictionaryParser.h"
#import "DropboxCreateSharedLinkWithSettingsArg+DictionarySerializer.h"
#import "DropboxSharedLinkMetadataParseManager.h"
#import "DropboxGetMetadataArgs+DictionarySerializer.h"
#import "DropboxSharedFolderMetadata+DictionaryParser.h"
#import "DropboxGetSharedLinkMetadataArg+DictionarySerializer.h"
#import "DropboxSharedLinkMetadata+DictionaryParser.h"
#import "DropboxListFolderMembersArgs+DictionarySerializer.h"
#import "DropboxSharedFolderMembers+DictionaryParser.h"
#import "DropboxListFolderMembersContinueArg+DictionarySerializer.h"
#import "DropboxListFoldersResult+DictionaryParser.h"
#import "DropboxListFoldersArgs+DictionarySerializer.h"
#import "DropboxListFoldersContinueArg+DictionarySerializer.h"
#import "DropboxListSharedLinksArg+DictionarySerializer.h"
#import "DropboxListSharedLinksResult+DictionaryParser.h"
#import "DropboxModifySharedLinkSettingsArgs+DictionarySerializer.h"
#import "DropboxMountFolderArg+DictionarySerializer.h"
#import "DropboxRelinquishFolderMembershipArg+DictionarySerializer.h"
#import "DropboxRemoveFolderMemberArg+DictionarySerializer.h"
#import "DropboxLaunchEmptyResult+DictionaryParser.h"
#import "DropboxRevokeSharedLinkArg+DictionarySerializer.h"
#import "DropboxShareFolderArg+DictionarySerializer.h"
#import "DropboxShareFolderLaunch+DictionaryParser.h"
#import "DropboxTransferFolderArg+DictionarySerializer.h"
#import "DropboxUnmountFolderArg+DictionarySerializer.h"
#import "DropboxUnshareFolderArg+DictionarySerializer.h"
#import "DropboxUpdateFolderMemberArg+DictionarySerializer.h"
#import "DropboxUpdateFolderPolicyArg+DictionarySerializer.h"
#import "DropboxSharedFolderMetadata+DictionaryParser.h"

@implementation DropboxSharingRoutes

- (void)addFolderMember:(DropboxAddFolderMemberArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"add_folder_member" param:arg success:successBlock fail:failBlock];
}

- (void)checkJobStatus:(DropboxPollArg *)arg success:(void (^)(DropboxJobStatusResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"check_job_status" param:arg resultType:[DropboxJobStatusResult class] success:successBlock fail:failBlock];
}

- (void)checkShareJobStatus:(DropboxPollArg *)arg success:(void (^)(DropboxShareFolderJobStatusResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"check_share_job_status" param:arg resultType:[DropboxShareFolderJobStatusResult class] success:successBlock fail:failBlock];
}

- (void)createSharedLinkWithSettings:(DropboxCreateSharedLinkWithSettingsArg *)arg success:(void (^)(DropboxSharedLinkMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"create_shared_link_with_settings" param:arg resultType:[DropboxSharedLinkMetadata class] success:successBlock fail:failBlock];
}

- (void)getFolderMetadata:(DropboxGetMetadataArgs *)arg success:(void (^)(DropboxSharedFolderMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_folder_metadata" param:arg resultType:[DropboxSharedFolderMetadata class] success:successBlock fail:failBlock];
}

- (DropboxDownloadTask *)getSharedLinkFile:(DropboxGetSharedLinkMetadataArg *)arg destUrl:(NSURL *)destFileUrl progress:(DownloadTaskProgressHandler _Nullable)progressBlock success:(void (^)(DropboxSharedLinkMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    return [self.delegate contentDownloadEndpointWithRoute:@"get_shared_link_file" param:arg destinationFileUrl:destFileUrl resultType:[DropboxSharedLinkMetadata class] progress:progressBlock success:successBlock fail:failBlock];
}

- (void)getSharedLinkMetadata:(DropboxGetSharedLinkMetadataArg *)arg success:(void (^)(DropboxSharedLinkMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_shared_link_metadata" param:arg resultType:[DropboxSharedLinkMetadata class] success:successBlock fail:failBlock];
}

- (void)listFolderMembers:(DropboxListFolderMembersArgs *)arg success:(void (^)(DropboxSharedFolderMembers * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder_members" param:arg resultType:[DropboxSharedFolderMembers class] success:successBlock fail:failBlock];
}

- (void)listFolderMembersContinue:(DropboxListFolderMembersContinueArg *)arg success:(void (^)(DropboxSharedFolderMembers * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folder_members/continue" param:arg resultType:[DropboxSharedFolderMembers class] success:successBlock fail:failBlock];
}

- (void)listFolders:(DropboxListFoldersArgs *)arg success:(void (^)(DropboxListFoldersResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folders" param:arg resultType:[DropboxListFoldersResult class] success:successBlock fail:failBlock];
}

- (void)listFoldersContinue:(DropboxListFoldersContinueArg *)arg success:(void (^)(DropboxListFoldersResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_folders/continue" param:arg resultType:[DropboxListFoldersResult class] success:successBlock fail:failBlock];
}

- (void)listMountableFolders:(DropboxListFoldersArgs *)arg success:(void (^)(DropboxListFoldersResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_mountable_folders" param:arg resultType:[DropboxListFoldersResult class] success:successBlock fail:failBlock];
}

- (void)listMountableFoldersContinue:(DropboxListFoldersContinueArg *)arg success:(void (^)(DropboxListFoldersResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_mountable_folders/continue" param:arg resultType:[DropboxListFoldersResult class] success:successBlock fail:failBlock];
}

- (void)listSharedLinks:(DropboxListSharedLinksArg *)arg success:(void (^)(DropboxListSharedLinksResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"list_shared_links" param:arg resultType:[DropboxListSharedLinksResult class] success:successBlock fail:failBlock];
}

- (void)modifySharedLinkSettings:(DropboxModifySharedLinkSettingsArgs *)arg success:(void (^)(DropboxSharedLinkMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"modify_shared_link_settings" param:arg resultType:[DropboxSharedLinkMetadata class] success:successBlock fail:failBlock];
}

- (void)mountFolder:(DropboxMountFolderArg *)arg success:(void (^)(DropboxSharedFolderMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"mount_folder" param:arg resultType:[DropboxSharedFolderMetadata class] success:successBlock fail:failBlock];
}

- (void)relinquishFolderMembership:(DropboxRelinquishFolderMembershipArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"relinquish_folder_membership" param:arg success:successBlock fail:failBlock];
}

- (void)removeFolderMember:(DropboxRemoveFolderMemberArg *)arg success:(void (^)(DropboxLaunchEmptyResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"remove_folder_member" param:arg resultType:[DropboxLaunchEmptyResult class] success:successBlock fail:failBlock];
}

- (void)revokeSharedLink:(DropboxRevokeSharedLinkArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"revoke_shared_link" param:arg success:successBlock fail:failBlock];
}

- (void)shareFolder:(DropboxShareFolderArg *)arg success:(void (^)(DropboxShareFolderLaunch * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"share_folder" param:arg resultType:[DropboxShareFolderLaunch class] success:successBlock fail:failBlock];
}

- (void)transferFolder:(DropboxTransferFolderArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"transfer_folder" param:arg success:successBlock fail:failBlock];
}

- (void)unmountFolder:(DropboxUnmountFolderArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"unmount_folder" param:arg success:successBlock fail:failBlock];
}

- (void)unshareFolder:(DropboxUnshareFolderArg *)arg success:(void (^)(DropboxLaunchEmptyResult * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"unshare_folder" param:arg resultType:[DropboxLaunchEmptyResult class] success:successBlock fail:failBlock];
}

- (void)updateFolderMember:(DropboxUpdateFolderMemberArg *)arg success:(void (^)(void))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"update_folder_member" param:arg success:successBlock fail:failBlock];
}

- (void)updateFolderPolicy:(DropboxUpdateFolderPolicyArg *)arg success:(void (^)(DropboxSharedFolderMetadata * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"update_folder_policy" param:arg resultType:[DropboxSharedFolderMetadata class] success:successBlock fail:failBlock];
}

@end
