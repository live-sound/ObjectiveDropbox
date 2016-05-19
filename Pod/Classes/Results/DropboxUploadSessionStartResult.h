//
//  DropboxUploadSessionStartResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxUploadSessionStartResult : NSObject

/**
 *  A unique identifier for the upload session. Pass this to upload_session/append and upload_session/finish.
 */
@property (nonatomic, nonnull) NSString *sessionID;

@end
