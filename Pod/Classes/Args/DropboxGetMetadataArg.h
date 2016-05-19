//
//  DropboxGetMetadataArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxGetMetadataArg : NSObject

/**
 *  The path of a file or folder on Dropbox. Examples: "/Homework/math", "id:a4ayc_80_OEAAAAAAAAAYa", "rev:a1c10ce0dd78"
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  If true, FileMetadata.media_info is set for photo and video. The default for this field is False.
 */
@property (nonatomic) BOOL includeMediaInfo;

/**
 *  If true, DeletedMetadata will be returned for deleted file or folder, otherwise LookupError.not_found will be returned. The default for this field is False.
 */
@property (nonatomic) BOOL includeDeleted;


- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path includeMediaInfo:(BOOL)includeMediaInfo includeDeleted:(BOOL)includeDeleted;

@end
