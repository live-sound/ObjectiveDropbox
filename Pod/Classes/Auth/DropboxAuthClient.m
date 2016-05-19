//
//  DropboxAuthClient.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.05.16.
//
//

#import "DropboxAuthClient.h"
#import "NSObject+GetTopMostViewController.h"

typedef void (^AuthFailedBlock)(NSString * _Nonnull errorSummary);
typedef void (^AuthSuccededBlock)(NSString * _Nonnull token);

@implementation DropboxAuthClient
{
    AuthSuccededBlock _authSuccededBlock;
    AuthFailedBlock _authFailedBlock;
    UIViewController *topMostViewController;
    UINavigationController *nav;
}

- (instancetype)initWithAuthViewController:(UIViewController<DropboxAuthViewControllerProtocol> *)authViewController andWithDelegate:(id<DropboxAuthClientDelegate>)delegate
{
    self = [self init];
    if (self) {
        _authViewController = authViewController;
        _delegate = delegate;
    }
    return self;
}

- (void)getNewTokenWithSuccess:(void (^)(NSString * _Nonnull))success fail:(void (^)(NSString * _Nonnull))fail
{
    _authSuccededBlock = success;
    _authFailedBlock = fail;
    topMostViewController = [self getTopMostViewController];
    nav = [[UINavigationController alloc] initWithRootViewController:self.authViewController];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    [topMostViewController presentViewController:nav animated:YES completion:nil];
}

#pragma mark - DropboxAuthDelegate

- (void)dropboxAuthCompletedWithAccessToken:(NSString *)accessToken tokenType:(NSString *)tokenType uid:(NSString *)uid
{
    if (_authSuccededBlock)
    {
        _authSuccededBlock(accessToken);        
    }
    if (_delegate && [_delegate respondsToSelector:@selector(authClient:didReceiveToken:)])
    {
        [_delegate authClient:self didReceiveToken:accessToken];
    }
    [self authorizationFinished];
}

- (void)dropboxAuthCanceled
{
    if (_authFailedBlock)
    {
        _authFailedBlock(@"Authorization canceled");
    }
    [self authorizationFinished];
}

- (void)authorizationFinished
{
    // topMostViewController == nav.parentViewController ?
    [topMostViewController dismissViewControllerAnimated:YES completion:nil];
    nav = nil;
    topMostViewController = nil;
    _authSuccededBlock = _authFailedBlock = nil;
}

@end
