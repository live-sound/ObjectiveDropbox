//
//  DropboxListFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderArg : NSObject

/**
 *  The path to the folder you want to see the contents of.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *   If true, the list folder operation will be applied recursively to all subfolders and the response will contain contents of all subfolders. The default for this field is False.
 */
@property (nonatomic) BOOL recursive;

/**
 *  If true, FileMetadata.media_info is set for photo and video. The default for this field is False.
 */
@property (nonatomic) BOOL includeMediaInfo;

/**
 *   If true, the results will include entries for files and folders that used to exist but were deleted. The default for this field is False.
 */
@property (nonatomic) BOOL includeDeleted;

/**
 *  If YES, the results will include a flag for each file indicating whether or not that file has any explicit members. The default for this field is NO.
 */
@property (nonatomic) BOOL includeHasExplicitSharedMembers;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path recursive:(BOOL)recursive includeMediaInfo:(BOOL)includeMediaInfo includeDeleted:(BOOL)includeDeleted includeHasExplicitSharedMembers:(BOOL)includeHasExplicitSharedMembers;
- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path;

@end
