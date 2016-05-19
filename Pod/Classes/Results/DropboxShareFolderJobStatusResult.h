//
//  DropboxShareFolderJobStatusResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderMetadata.h"

typedef enum : NSUInteger {
    
    /**
     *  The asynchronous job is still in progress.
     */
    DSFJSInProgress,
    
    /**
     *  The share job has finished. The value is the metadata for the folder.
     */
    DSFJSComplete,
    DSFJSFailed,
    DSFJSNotSet
} DropboxShareFolderJobStatus;

@interface DropboxShareFolderJobStatusResult : NSObject

@property (nonatomic) DropboxShareFolderJobStatus status;

/**
 *  The metadata which includes basic information about the shared folder. Used when status = DSFJSComplete
 */
@property (nonatomic, nullable) DropboxSharedFolderMetadata *metadata;

/**
 *  Used when status = DSFJSFailed
 */
@property (nonatomic, nullable) NSString * errorSummary;

@end
