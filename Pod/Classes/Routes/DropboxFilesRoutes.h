//
//  DropboxFilesRoutes.h
//  Pods
//
//  Created by Михаил Мотыженков on 02.04.16.
//
//

#import "DropboxRoutes.h"
#import "DropboxRelocationArg.h"
#import "DropboxFolderMetadata.h"
#import "DropboxFileMetadata.h"
#import "DropboxCreateFolderArg.h"
#import "DropboxDeleteArg.h"
#import "DropboxDownloadArg.h"
#import "DropboxGetMetadataArg.h"
#import "DropboxGetPreviewArg.h"
#import "DropboxGetTemporaryLinkResult.h"
#import "DropboxGetTemporaryLinkArg.h"
#import "DropboxGetThumbnailArg.h"
#import "DropboxListFolderResult.h"
#import "DropboxListFolderArg.h"
#import "DropboxListFolderContinueArg.h"
#import "DropboxListFolderGetLatestCursorResult.h"
#import "DropboxListFolderLongpollArg.h"
#import "DropboxListFolderLongpollResult.h"
#import "DropboxListRevisionsArg.h"
#import "DropboxListRevisionsResult.h"
#import "DropboxRestoreArg.h"
#import "DropboxSearchArg.h"
#import "DropboxSearchResult.h"
#import "DropboxCommitInfo.h"
#import "DropboxUploadSessionAppendArg.h"
#import "DropboxUploadSessionFinishArg.h"
#import "DropboxUploadSessionStartArg.h"
#import "DropboxUploadSessionStartResult.h"
#import "DropboxMetadata.h"
#import "DropboxUrlSessionHandlers.h"
#import "DropboxDownloadTask.h"
#import "DropboxUploadTask.h"

@interface DropboxFilesRoutes : DropboxRoutes

/**
 *  Copy a file or folder to a different location in the user's Dropbox.
 If the source path is a folder all its contents will be copied.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)copy:(DropboxRelocationArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Create a folder at a given path.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)createFolder:(DropboxCreateFolderArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxFolderMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Delete the file or folder at a given path.
 If the path is a folder, all its contents will be deleted too.
 A successful response indicates that the file or folder was deleted. The returned metadata will be the corresponding FileMetadata or FolderMetadata for the item at time of deletion, and not a DeletedMetadata object.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)delete:(DropboxDeleteArg * _Nonnull)arg success:(void(^_Nullable)(DropboxMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Download a file from a user's Dropbox.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (DropboxDownloadTask * _Nonnull)download:(DropboxDownloadArg * _Nonnull)arg destFileUrl:(NSURL * _Nonnull)destFileUrl progress:(nullable DownloadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull metadata))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns the metadata for a file or folder.
 Note: Metadata for the root folder is unsupported.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)getMetadata:(DropboxGetMetadataArg * _Nonnull)arg success:(void(^_Nullable)(DropboxMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get a preview for a file. Currently previews are only generated for the files with the following extensions: .doc, .docx, .docm, .ppt, .pps, .ppsx, .ppsm, .pptx, .pptm, .xls, .xlsx, .xlsm, .rtf
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (DropboxDownloadTask * _Nonnull)getPreview:(DropboxGetPreviewArg * _Nonnull)arg destFileUrl:(NSURL * _Nonnull)destFileUrl progress:(nullable DownloadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull metadata))successBlock fail:(nonnull ErrorBlock)failBlock;

/**
 *  Get a temporary link to stream content of a file. This link will expire in four hours and afterwards you will get 410 Gone. Content-Type of the link is determined automatically by the file's mime type.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)getTemporaryLink:(DropboxGetTemporaryLinkArg * _Nonnull)arg success:(void(^_Nullable)(DropboxGetTemporaryLinkResult * _Nonnull temporaryLinkResult))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get a thumbnail for an image. This method currently supports files with the following file extensions: jpg, jpeg, png, tiff, tif, gif and bmp. Photos that are larger than 20MB in size won't be converted to a thumbnail.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (DropboxDownloadTask * _Nonnull)getThumbnail:(DropboxGetThumbnailArg * _Nonnull)arg destFileUrl:(NSURL * _Nonnull)destFileUrl progress:(nullable DownloadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull metadata))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Returns the contents of a folder. If you want to specify the root folder use empty string, otherwise start the path with "/".
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listFolder:(DropboxListFolderArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFolderResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Once a cursor has been retrieved from listFolderWithPath, use this to paginate through all files and retrieve updates to the folder.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listFolderContinue:(DropboxListFolderContinueArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFolderResult * _Nonnull result))successBlock fail:(nonnull ErrorBlock)failBlock;

/**
 *  A way to quickly get a cursor for the folder's state. Unlike listFolder, listFolderGetLatestCursor doesn't return any entries. This endpoint is for app which only needs to know about new files and modifications and doesn't need to know about files that already exist in Dropbox.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listFolderGetLatestCursor:(DropboxListFolderArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFolderGetLatestCursorResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  A longpoll endpoint to wait for changes on an account. In conjunction with listFolder, this call gives you a low-latency way to monitor an account for file changes. The connection will block until there are changes available or a timeout occurs. This endpoint is useful mostly for client-side apps. If you're looking for server-side notifications, check out Dropbox webhooks documentation.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listFolderLongpoll:(DropboxListFolderLongpollArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListFolderLongpollResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Return revisions of a file
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)listRevisions:(DropboxListRevisionsArg * _Nonnull)arg success:(void(^_Nullable)(DropboxListRevisionsResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Move a file or folder to a different location in the user's Dropbox. If the source path is a folder all its contents will be moved.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)move:(DropboxRelocationArg * _Nonnull)arg success:(void(^_Nullable)(DropboxMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Permanently delete the file or folder at a given path (see https://www.dropbox.com/en/help/40). Note: This endpoint is only available for Dropbox Business apps.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)permanentlyDelete:(DropboxDeleteArg * _Nonnull)arg success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Restore a file to a specific revision
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)restore:(DropboxRestoreArg * _Nonnull)arg success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Searches for files and folders. Note: Recent changes may not immediately be reflected in search results due to a short delay in indexing.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock    
 */
- (void)search:(DropboxSearchArg * _Nonnull)arg success:(void(^_Nullable)(DropboxSearchResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Upload selected file to Dropbox path. This method works for any file size. If you upload file larger than 150 MB this method internally splits the file and calls uploadSessionStart, uploadSessionAppend and uploadSessionFinish methods.
 *
 *  @param arg
 *  @param sourceFileUrl
 *  @param progressBlock
 *  @param successBlock
 *  @param failBlock
 *
 *  @return UploadTaskID
 */
- (DropboxUploadTask * _Nonnull)upload:(DropboxCommitInfo * _Nonnull)arg sourceFileUrl:(NSURL * _Nonnull)sourceFileUrl progress:(nullable UploadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Append more data to an upload session. When the parameter close is set, this call will close the session. If you call this method directly you have to split your file manually in individual small files and specify NSURL to appropriate piece. A single request should not upload more than 150 MB of file contents.
 *
 *  @param arg
 *  @param data
 *  @param successBlock
 *  @param failBlock
 *
 *  @return UploadTaskID
 */
- (DropboxUploadTask * _Nonnull)uploadSessionAppend:(DropboxUploadSessionAppendArg * _Nonnull)arg sourceFileUrl:(NSURL * _Nonnull)sourceFileUrl progress:(nullable UploadTaskProgressHandler)progressBlock success:(void(^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Finish an upload session and save the uploaded data to the given file path. If you call this method directly you have to split your file manually in individual small files and specify NSURL to appropriate piece. A single request should not upload more than 150 MB of file contents.
 *
 *  @param arg
 *  @param data
 *  @param successBlock
 *  @param failBlock   
 *
 *  @return UploadTaskID
 */
- (DropboxUploadTask * _Nonnull)uploadSessionFinish:(DropboxUploadSessionFinishArg * _Nonnull)arg sourceFileUrl:(NSURL * _Nonnull)sourceFileUrl progress:(nullable UploadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxFileMetadata * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Upload sessions allow you to upload a single file using multiple requests. This call starts a new upload session with the given data. If you call this method directly you have to split your file manually in individual small files and specify NSURL to appropriate piece. You can then use uploadSessionAppend to add more data and uploadSessionFinish to save all the data to a file in Dropbox. A single request should not upload more than 150 MB of file contents.
 *
 *  @param arg
 *  @param data
 *  @param successBlock
 *  @param failBlock
 *
 *  @return UploadTaskID
 */
- (DropboxUploadTask * _Nonnull)uploadSessionStart:(DropboxUploadSessionStartArg * _Nonnull)arg sourceFileUrl:(NSURL * _Nonnull)sourceFileUrl progress:(nullable UploadTaskProgressHandler)progressBlock success:(void(^_Nullable)(DropboxUploadSessionStartResult * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

@end
