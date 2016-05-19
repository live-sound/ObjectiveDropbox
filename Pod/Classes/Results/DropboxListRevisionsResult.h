//
//  DropboxListRevisionsResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFileMetadata.h"

@interface DropboxListRevisionsResult : NSObject

/**
 *  If the file is deleted.
 */
@property (nonatomic) BOOL isDeleted;

/**
 *  The revisions for the file. Only non-delete revisions will show up here.
 */
@property (nonatomic, nonnull) NSArray<DropboxFileMetadata *> *entries;

@end
