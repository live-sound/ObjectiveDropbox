//
//  DropboxSearchResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSearchMatch.h"

@interface DropboxSearchResult : NSObject

/**
 *  A list (possibly empty) of matches for the query.
 */
@property (nonatomic, nonnull) NSArray<DropboxSearchMatch *> *matches;

/**
 *  Used for paging. If true, indicates there is another page of results available that can be fetched by calling search again.
 */
@property (nonatomic) BOOL more;

/**
 *  Used for paging. Value to set the start argument to when calling search to fetch the next page of results.
 */
@property (nonatomic) UInt64 start;

@end
