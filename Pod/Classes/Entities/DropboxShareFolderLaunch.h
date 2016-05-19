//
//  DropboxShareFolderLaunch.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderMetadata.h"
#import "DropboxShareFolderLaunchEnum.h"

@interface DropboxShareFolderLaunch : NSObject

@property (nonatomic) DropboxShareFolderLaunchEnum type;

/**
 *  The value for type == DSFLAsyncJobID. The string is an id that can be used to obtain the status of the asynchronous job.
 */
@property (nonatomic, nonnull) NSString * asyncJobIDValue;

/**
 *  The value for type == DSFLComplete.
 */
@property (nonatomic, nonnull) DropboxSharedFolderMetadata *completeValue;

@end
