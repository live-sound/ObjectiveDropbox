//
//  DropboxUploadSessionStartArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxUploadSessionStartArg : NSObject

/**
 *  If true, current session will be closed. You cannot do upload_session/append any more to current session The default for this field is False.
 */
@property (nonatomic) BOOL close;

- (nonnull instancetype)initWithClose:(BOOL)close;

@end
