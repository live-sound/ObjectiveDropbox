//
//  DropboxClient.m
//  Pods
//
//  Created by Михаил Мотыженков on 13.04.16.
//
//

#import "DropboxClient.h"
#import "DropboxHttpHelper.h"
#import "DropboxRoutes.h"
#import "DropboxErrors.h"
#import "DropboxAuthClient.h"
#import "DropboxAuthViewController.h"
#import "DropboxUrlSessionDelegate.h"
#import "SSKeychain.h"

NSString * const filesPath = @"files";
NSString * const sharingPath = @"sharing";
NSString * const usersPath = @"users";
NSString * const authPath = @"auth";

NSString * const hostRpc = @"https://api.dropboxapi.com/2";
NSString * const hostUpload = @"https://content.dropboxapi.com/2";
NSString * const hostDownload = @"https://content.dropboxapi.com/2";

static const uint maxSimultaneousDataRequests = 2;
static const uint maxSimultaneousBackgroundRequests = 2;
NSString * const backgroundSessionID = @"ObjectiveDropboxSession";
NSString * const kToken = @"accessToken";
NSString * const kAccount = @"ObjectiveDropbox default account";

@interface DropboxClient () <DropboxAuthClientDelegate>

@property (nonatomic) NSArray<DropboxHttpHelper *> *httpHelpers;
@property (nonatomic) DropboxUrlSessionDelegate *sessionDelegate;
@property (nonatomic) NSString *kKeychainService;

@end


@implementation DropboxClient
{
    NSString * _accessToken;
    NSURLSession * _backgroundSession, *_rpcSession;
}

- (instancetype)initWithAppKey:(NSString * _Nonnull)appKey redirectURL:(NSString * _Nullable)redirectURL restartAllTasksAfterRelaunch:(BOOL)restartAllTasksAfterRelaunch keychainAccount:(NSString *)keychainAccount
{
    self = [super init];
    if (self) {
        _authClient = [[DropboxAuthClient alloc] initWithDelegate:self];
        self.appKey = appKey;
        self.redirectURL = redirectURL;
        
        _sessionDelegate = [DropboxUrlSessionDelegate new];
        _rpcSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:nil];
        _backgroundSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:backgroundSessionID] delegate:_sessionDelegate delegateQueue:nil];
        _rpcSession.configuration.HTTPMaximumConnectionsPerHost = maxSimultaneousDataRequests;
        _backgroundSession.configuration.HTTPMaximumConnectionsPerHost = maxSimultaneousBackgroundRequests;
        
        [self initRoutesAndHttpHelpers];
        [self initKeychain];
        
        _restartAllTasksAfterRelaunch = restartAllTasksAfterRelaunch;
        if (_restartAllTasksAfterRelaunch)
        {
            [_sessionDelegate restartAllTasksFromSession:_backgroundSession];
        }
    }
    return self;
}

- (instancetype)initWithAppKey:(NSString *)appKey redirectURL:(NSString *)redirectURL keychainAccount:(NSString *)keychainAccount
{
    return [self initWithAppKey:appKey redirectURL:redirectURL restartAllTasksAfterRelaunch:YES keychainAccount:keychainAccount];
}

- (instancetype)initWithAppKey:(NSString *)appKey redirectURL:(NSString *)redirectURL restartAllTasksAfterRelaunch:(BOOL)restartAllTasksAfterRelaunch
{
    return [self initWithAppKey:appKey redirectURL:redirectURL restartAllTasksAfterRelaunch:restartAllTasksAfterRelaunch keychainAccount:kAccount];
}

- (void)initRoutesAndHttpHelpers
{
    DropboxHttpHelper *filesHelper = [DropboxHttpHelper new];
    DropboxHttpHelper *sharingHelper = [DropboxHttpHelper new];
    DropboxHttpHelper *usersHelper = [DropboxHttpHelper new];
    DropboxHttpHelper *authHelper = [DropboxHttpHelper new];
    self.httpHelpers = @[filesHelper, sharingHelper, usersHelper, authHelper];
    for (DropboxHttpHelper *helper in self.httpHelpers)
    {
        helper.hostRpc = hostRpc;
        helper.hostUpload = hostUpload;
        helper.hostDownload = hostDownload;
        helper.dataSession = _rpcSession;
        helper.backgroundSession = _backgroundSession;
        helper.accessToken = _accessToken;
        helper.sessionDelegate = _sessionDelegate;
    }
    self.files = [[DropboxFilesRoutes alloc] initWithPath:filesPath andWithDelegate:filesHelper];
    self.sharing = [[DropboxSharingRoutes alloc] initWithPath:sharingPath andWithDelegate:sharingHelper];
    self.users = [[DropboxUsersRoutes alloc] initWithPath:usersPath andWithDelegate:usersHelper];
    self.auth = [[DropboxAuthRoutes alloc] initWithPath:authPath andWithDelegate:authHelper];
}

- (void)initKeychain
{
    if (!self.accessToken)
    {
        self.accessToken = [SSKeychain passwordForService:self.kKeychainService account:self.keychainAccount];
    }
}

- (NSString *)kKeychainService
{
    if (!_kKeychainService)
    {
        _kKeychainService = [NSString stringWithFormat:@"%@.ObjectiveDropbox", [NSBundle mainBundle].bundleIdentifier];
    }
    return _kKeychainService;
}

- (NSString *)keychainAccount
{
    if (!_keychainAccount)
    {
        _keychainAccount = kAccount;
    }
    return _keychainAccount;
}

- (NSString *)accessToken
{
    @synchronized (self) {
        return _accessToken;
    }
}

- (void)setAccessToken:(NSString *)accessToken
{
    if (accessToken == _accessToken || accessToken == nil) return;
    
    @synchronized (self) {
        _accessToken = accessToken;
        for (DropboxHttpHelper *helper in self.httpHelpers)
        {
            helper.accessToken = accessToken;
            [SSKeychain setPassword:accessToken forService:self.kKeychainService account:kAccount];
        }
    }
}

- (void)removeTokenFromKeychain
{
    [SSKeychain deletePasswordForService:self.kKeychainService account:kAccount];
}

- (NSURLSession *)rpcSession
{
    @synchronized (self) {
        return _rpcSession;
    }
}

- (void)setRpcSession:(NSURLSession *)rpcSession
{
    @synchronized (self) {
        _rpcSession = rpcSession;
        for (DropboxHttpHelper *helper in self.httpHelpers)
        {
            helper.dataSession = rpcSession;
        }
    }
}

- (NSURLSession *)backgroundSession
{
    @synchronized (self) {
        return _backgroundSession;
    }
}

- (void)setBackgroundSession:(NSURLSession *)backgroundSession
{
    @synchronized (self) {
        _backgroundSession = backgroundSession;
        for (DropboxHttpHelper *helper in self.httpHelpers)
        {
            helper.backgroundSession = backgroundSession;
        }
    }
}

- (void)getNewTokenWithSuccess:(void (^)())successBlock fail:(void (^)(NSString * _Nonnull))failBlock
{
    UIViewController<DropboxAuthViewControllerProtocol> *authVC = [DropboxAuthViewController new];
    authVC.redirectURL = self.redirectURL;
    authVC.appKey = self.appKey;
    authVC.delegate = self.authClient;
    [_authClient getNewTokenWithAuthViewController:authVC success:^(NSString * _Nonnull token) {
        self.accessToken = token;
        if (successBlock)
        {
            successBlock();
        }
    } fail:failBlock];
}

- (void)dealloc
{
    [self.rpcSession finishTasksAndInvalidate];
    [self.backgroundSession finishTasksAndInvalidate];
}

#pragma mark - AuthClientDelegate

- (void)authClient:(id<DropboxAuthClientDelegate>)authClient didReceiveToken:(NSString *)token
{
    self.accessToken = token;
}

@end
