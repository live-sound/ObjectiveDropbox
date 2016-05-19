//
//  DropboxSearchMatch.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSearchMatchType.h"
#import "DropboxMetadata.h"

@interface DropboxSearchMatch : NSObject

/**
 *  The type of the match.
 */
@property (nonatomic) DropboxSearchMatchType matchType;

/**
 *  The metadata for the matched file or folder.
 */
@property (nonatomic, nullable) DropboxMetadata *metadata;

@end
