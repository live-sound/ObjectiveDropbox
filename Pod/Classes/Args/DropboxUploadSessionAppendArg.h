//
//  DropboxUploadSessionAppendArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxUploadSessionCursor.h"

@interface DropboxUploadSessionAppendArg : NSObject

/**
 *  Contains the upload session ID and the offset.
 */
@property (nonatomic, nonnull) DropboxUploadSessionCursor *cursor;

/**
 *  If true, current session will be closed. You cannot do upload_session/append any more to current session The default for this field is False. 
 */
@property (nonatomic) BOOL close;

- (nonnull instancetype)initWithCursor:(DropboxUploadSessionCursor * _Nonnull)cursor close:(BOOL)close;

@end
