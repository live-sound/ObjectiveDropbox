//
//  DropboxSearchArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSearchMode.h"

@interface DropboxSearchArg : NSObject

/**
 *  The path in the user's Dropbox to search. Should probably be a folder.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  The string to search for. The search string is split on spaces into multiple tokens. For file name searching, the last token is used for prefix matching (i.e. "bat c" matches "bat cave" but not "batman car").
 */
@property (nonatomic, nonnull) NSString *query;

/**
 *  The starting index within the search results (used for paging). The default for this field is 0.
 */
@property (nonatomic) UInt64 start;

/**
 *  The maximum number of search results to return. The default for this field is 100.
 */
@property (nonatomic) UInt64 maxResults;

/**
 *  The search mode (filename, filename_and_content, or deleted_filename). Note that searching file content is only available for Dropbox Business accounts. The default for this field is filename.
 */
@property (nonatomic) DropboxSearchMode mode;

/**
 *  Full initializer
 *
 *  @param path       The path in the user's Dropbox to search. Should probably be a folder.
 *  @param query      The string to search for. The search string is split on spaces into multiple tokens. For file name searching, the last token is used for prefix matching (i.e. "bat c" matches "bat cave" but not "batman car").
 *  @param start      The starting index within the search results (used for paging). The default for this field is 0.
 *  @param maxResults The maximum number of search results to return. The default for this field is 100.
 *  @param mode       The search mode (filename, filename_and_content, or deleted_filename). Note that searching file content is only available for Dropbox Business accounts. The default for this field is filename.
 *
 *  @return
 */
- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path query:(NSString * _Nonnull)query start:(UInt64)start maxResults:(UInt64)maxResults mode:(DropboxSearchMode)mode;

/**
 *  Short initializer
 *
 *  @param path  The path in the user's Dropbox to search. Should probably be a folder.
 *  @param query The string to search for. The search string is split on spaces into multiple tokens. For file name searching, the last token is used for prefix matching (i.e. "bat c" matches "bat cave" but not "batman car").
 *
 *  @return 
 */
- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path query:(NSString * _Nonnull)query;

@end
