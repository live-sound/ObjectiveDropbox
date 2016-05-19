//
//  DropboxCommitInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxWriteMode.h"

@interface DropboxCommitInfo : NSObject

/**
 *  Path in the user's Dropbox to save the file.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  Selects what to do if the file already exists. The default for this union is add.
 */
@property (nonatomic, nonnull) DropboxWriteMode *mode;

/**
 *  If there's a conflict, as determined by mode, have the Dropbox server try to autorename the file to avoid conflict. The default for this field is False.
 */
@property (nonatomic) BOOL autorename;

/**
 *  The value to store as the client_modified timestamp. Dropbox automatically records the time at which the file was written to the Dropbox servers. It can also record an additional timestamp, provided by Dropbox desktop clients, mobile clients, and API apps of when the file was actually created or modified. This field is optional.
 */
@property (nonatomic, nullable) NSDate *clientModified;

/**
 *  Normally, users are made aware of any file modifications in their Dropbox account via notifications in the client software. If true, this tells the clients that this modification shouldn't result in a user notification. The default for this field is False.
 */
@property (nonatomic) BOOL mute;


- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path mode:(DropboxWriteMode * _Nonnull)mode autorename:(BOOL)autorename clientModified:(NSDate * _Nullable)clientModified mute:(BOOL)mute;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path mode:(DropboxWriteMode * _Nonnull)mode;

@end
