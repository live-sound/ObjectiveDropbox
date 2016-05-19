//
//  DropboxModifySharedLinkSettingsArgs.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkSettings.h"


@interface DropboxModifySharedLinkSettingsArgs : NSObject

/**
 *  URL of the shared link to change its settings
 */
@property (nonatomic, nonnull) NSString *url;

/**
 *  Set of settings for the shared link.
 */
@property (nonatomic, nonnull) DropboxSharedLinkSettings *settings;

/**
 *  If set to YES, removes the expiration of the shared link. The default for this field is NO.
 */
@property (nonatomic) BOOL removeExpiration;


- (nonnull instancetype)initWithURL:(NSString * _Nonnull)url settings:(DropboxSharedLinkSettings * _Nonnull)settings removeExpiration:(BOOL)removeExpiration;

- (nonnull instancetype)initWithURL:(NSString * _Nonnull)url settings:(DropboxSharedLinkSettings * _Nonnull)settings;

@end
