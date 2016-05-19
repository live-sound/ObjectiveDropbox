//
//  DropboxUploadSessionCursor.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxUploadSessionCursor : NSObject

/**
 *  The upload session ID (returned by upload_session/start).
 */
@property (nonatomic, nonnull) NSString *sessionID;

/**
 *  The amount of data that has been uploaded so far. We use this to make sure upload data isn't lost or duplicated in the event of a network error.
 */
@property (nonatomic) UInt64 offset;

- (nonnull instancetype)initWithSessionID:(NSString * _Nonnull)sessionID offset:(UInt64)offset;

@end
