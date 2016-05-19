//
//  DropboxListSharedLinksResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkMetadata.h"

@interface DropboxListSharedLinksResult : NSObject

/**
 *  Shared links applicable to the path argument.
 */
@property (nonatomic, nonnull) NSArray<DropboxSharedLinkMetadata *> *links;

/**
 *  Is true if there are additional shared links that have not been returned yet. Pass the cursor into listSharedLinks to retrieve them.
 */
@property (nonatomic) BOOL hasMore;

/**
 *  Pass the cursor into listSharedLinks to obtain the additional links. Cursor is returned only if no path is given or the path is empty. This field is optional.
 */
@property (nonatomic, nullable) NSString *cursor;

@end
