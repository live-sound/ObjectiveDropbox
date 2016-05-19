//
//  DropboxClient.h
//  Pods
//
//  Created by Михаил Мотыженков on 13.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxFilesRoutes.h"
#import "DropboxSharingRoutes.h"
#import "DropboxUsersRoutes.h"
#import "DropboxAuthRoutes.h"
#import "DropboxAuthClientProtocol.h"
#import "DropboxAuthViewControllerProtocol.h"

/**
 This is the entry point for ObjectiveDropbox.
 */
@interface DropboxClient : NSObject

- (nonnull instancetype)initWithAuthViewController:(UIViewController<DropboxAuthViewControllerProtocol> * _Nonnull)viewController appKey:(NSString * _Nonnull)appKey redirectURL:(NSString * _Nullable)redirectURL restartAllTasksAfterRelaunch:(BOOL)restartAllTasksAfterRelaunch keychainAccount:(NSString * _Nonnull)keychainAccount;
- (nonnull instancetype)initWithAuthViewController:(UIViewController<DropboxAuthViewControllerProtocol> * _Nonnull)viewController appKey:(NSString * _Nonnull)appKey redirectURL:(NSString * _Nullable)redirectURL keychainAccount:(NSString * _Nonnull)keychainAccount;
- (nonnull instancetype)initWithAppKey:(NSString * _Nonnull)appKey redirectURL:(NSString * _Nullable)redirectURL restartAllTasksAfterRelaunch:(BOOL)restartAllTasksAfterRelaunch keychainAccount:(NSString * _Nonnull)keychainAccount;
- (nonnull instancetype)initWithAppKey:(NSString * _Nonnull)appKey redirectURL:(NSString * _Nullable)redirectURL restartAllTasksAfterRelaunch:(BOOL)restartAllTasksAfterRelaunch;

- (void)getNewTokenWithSuccess:(void(^ _Nullable)())successBlock fail:(void(^ _Nullable)(NSString * _Nonnull errorSummary))failBlock;
- (void)removeTokenFromKeychain;

@property (nullable) NSString *accessToken;
@property (nullable) NSString *appKey;
@property (nullable) NSString *redirectURL;
@property (nonnull) NSURLSession *rpcSession;
@property (nonnull) NSURLSession *backgroundSession;
@property (nonnull) id<DropboxAuthClientProtocol> authClient;
@property (nullable) id<DropboxAuthViewControllerProtocol> authViewController;
@property (nonatomic, nonnull) NSString *keychainAccount;
/**
 *  YES by default
 */
@property (nonatomic) BOOL restartAllTasksAfterRelaunch;

/**
 *  This object contains methods for basic file operations.
 */
@property (nonatomic, nonnull) DropboxFilesRoutes *files;

/**
 *  This object contains methods for creating and managing shared links and shared folders.
 */
@property (nonatomic, nonnull) DropboxSharingRoutes *sharing;

/**
 *  This object contains methods for user management.
 */
@property (nonatomic, nonnull) DropboxUsersRoutes *users;
@property (nonatomic, nonnull) DropboxAuthRoutes *auth;

@end
