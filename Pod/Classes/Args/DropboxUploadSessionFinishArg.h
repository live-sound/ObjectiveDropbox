//
//  DropboxUploadSessionFinishArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUploadSessionCursor.h"
#import "DropboxCommitInfo.h"

@interface DropboxUploadSessionFinishArg : NSObject

/**
 *  Contains the upload session ID and the offset.
 */
@property (nonatomic, nonnull) DropboxUploadSessionCursor *cursor;

/**
 *  Contains the path and other optional modifiers for the commit.
 */
@property (nonatomic, nonnull) DropboxCommitInfo *commit;

- (nonnull instancetype)initWithCursor:(DropboxUploadSessionCursor * _Nonnull)cursor commit:(DropboxCommitInfo * _Nonnull)commit;

@end
