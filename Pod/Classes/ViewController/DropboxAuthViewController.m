//
//  DropboxAuthenticationViewController.m
//  Pods
//
//  Created by Михаил Мотыженков on 01.04.16.
//
//

#import "DropboxAuthViewController.h"
#import <WebKit/WebKit.h>
#import "NSString+Helpers.h"

static NSString * const keyTokenType = @"token_type=";
static NSString * const keyUID = @"uid=";
static NSString * const keyAccessToken = @"access_token=";

static NSString * const authScheme = @"https";
static NSString * const authHost = @"www.dropbox.com";
static NSString * const authPath = @"1/oauth2/authorize";

static NSString * const kRedirectURI = @"http://localhost";


@interface DropboxAuthViewController () <UIWebViewDelegate, WKNavigationDelegate>

@property (nonatomic) NSURL *url;

@end


@implementation DropboxAuthViewController
{
    BOOL authorizationCompletedSuccessfully;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    authorizationCompletedSuccessfully = NO;
    if (NSClassFromString(@"WKWebView"))
    {
        [self createWebKitView];
    }
    else
    {
        [self createUIWebView];
    }
    
    [self createNavigationButtons];
}


- (void)createNavigationButtons
{
    self.navigationController.navigationBarHidden = NO;
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(buttonCancelTouched:)];
    self.navigationItem.leftBarButtonItem = leftButton;
}

- (void)buttonCancelTouched:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)authenticateWithUrl:(NSURL *)url
{
    NSURLComponents *components = [NSURLComponents componentsWithString:[url.absoluteString stringByReplacingOccurrencesOfString:@"#" withString:@"?"]];
    NSString *token, *type, *UID;
    
    NSArray *strings = [components.query componentsSeparatedByString:@"&"];
    for (NSString *string in strings)
    {
        if ([string hasPrefix:keyAccessToken])
        {
            token = [string stringAfterString:keyAccessToken];
        }
        else if ([string hasPrefix:keyTokenType])
        {
            type = [string stringAfterString:keyTokenType];
        }
        else if ([string hasPrefix:keyUID])
        {
            UID = [string stringAfterString:keyUID];
        }
    }
    [self authorizeWithAccessToken:token tokenType:type uid:UID];
}

- (NSURL * _Nonnull)getAuthorizeUrlWithAppKey:(NSString * _Nonnull)appKey
{
    return [self getAuthorizeUrlWithRedirectURI:self.redirectURL appKey:appKey state:nil require_role:nil];
}

- (NSURL * _Nonnull)getAuthorizeUrlWithRedirectURI:(NSString * _Nullable)redirectUri appKey:(NSString * _Nonnull)appKey state:(NSString * _Nullable)state require_role:(NSString * _Nullable)require_role
{
    if (!redirectUri)
    {
        redirectUri = kRedirectURI;
    }
    
    NSMutableString *result = [NSMutableString new];
    [result appendFormat:@"%@://%@/%@?response_type=token&client_id=%@&redirect_uri=%@", authScheme, authHost, authPath, appKey, redirectUri];
    if (state)
    {
        [result appendFormat:@"&state=%@", state];
    }
    if (require_role)
    {
        [result appendFormat:@"&require_role=%@", require_role];
    }
    
    return [NSURL URLWithString:result];
}

#pragma mark - UIWebView

- (void)createUIWebView
{
    UIWebView *oldWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:oldWebView];
    
    oldWebView.delegate = self;    
    self.url = [self getAuthorizeUrlWithAppKey:self.appKey];
    NSURLRequest *request = [NSURLRequest requestWithURL:self.url];
    [oldWebView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == 1 && [request.URL.absoluteString hasPrefix:self.redirectURL])
    {
        [self authenticateWithUrl:request.URL];
        return NO;
    }
    return YES;
}

#pragma mark - WKWebView

- (void)createWebKitView
{
    WKWebView *webKitView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webKitView];

    webKitView.navigationDelegate = self;
    NSURL *url = [self getAuthorizeUrlWithAppKey:self.appKey];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webKitView loadRequest:request];
}

- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation
{
    [self authenticateWithUrl:webView.URL];    
}


#pragma mark - DropboxAuthenticationDelegate

- (void)authorizeWithAccessToken:(NSString *)accessToken tokenType:(NSString *)tokenType uid:(NSString *)uid
{
    authorizationCompletedSuccessfully = YES;
    if (self.delegate)
    {
        [self.delegate dropboxAuthCompletedWithAccessToken:accessToken tokenType:tokenType uid:uid];
    }
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    if (!authorizationCompletedSuccessfully && self.delegate)
    {
        [self.delegate dropboxAuthCanceled];
    }
}

@end