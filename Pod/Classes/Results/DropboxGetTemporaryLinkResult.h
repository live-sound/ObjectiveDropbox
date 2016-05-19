//
//  DropboxGetTemporaryLinkResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFileMetadata.h"

@interface DropboxGetTemporaryLinkResult : NSObject

/**
 *  Metadata of the file.
 */
@property (nonatomic, nonnull) DropboxFileMetadata *metadata;

/**
 *  The temporary link which can be used to stream content the file.
 */
@property (nonatomic, nonnull) NSString *link;

@end
