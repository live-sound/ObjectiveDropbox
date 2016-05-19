//
//  DropboxCreateSharedLinkWithSettingsArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkSettings.h"

@interface DropboxCreateSharedLinkWithSettingsArg : NSObject

/**
 *  The path to be shared by the shared link
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  The requested settings for the newly created shared link This field is optional.
 */
@property (nonatomic, nullable) DropboxSharedLinkSettings *settings;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path settings:(DropboxSharedLinkSettings * _Nullable)settings;
- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path;

@end
