# ObjectiveDropbox

[![Version](https://img.shields.io/cocoapods/v/ObjectiveDropbox.svg?style=flat)](http://cocoapods.org/pods/ObjectiveDropbox)
[![License](https://img.shields.io/cocoapods/l/ObjectiveDropbox.svg?style=flat)](http://cocoapods.org/pods/ObjectiveDropbox)
[![Platform](https://img.shields.io/cocoapods/p/ObjectiveDropbox.svg?style=flat)](http://cocoapods.org/pods/ObjectiveDropbox)

The most complete Objective-C SDK for integrating with the Dropbox API v2. 

## What is it capable of?
Everything what Dropbox HTTP API v2 is capable of.

## Requirements
- Xcode >= 7
- iOS >= 8 for CocoaPods installation
- iOS >= 7 for manual installation

## Installation

ObjectiveDropbox is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ObjectiveDropbox"
```

Or you can install it manually by copying source files into your project. In this case you should add WebKit.framework with 'Optional' status to your target.

## Example project

To run the example project, clone the repo, and run 'ObjectiveDrobpox.xcworkspace' from the Example directory.

## Usage

**Use the following import:**
```obj-c
#import "DropboxClient.h"
```

**Then create DropboxClient:**
```obj-c
DropboxClient *dropboxClient = [[DropboxClient alloc] initWithAppKey:<DropboxApp key> 
                                redirectURL:<redirectURL> restartAllTasksAfterRelaunch:YES];
```
I recommend to use 'http://localhost' as redirectURL (don't forget to add it in your Dropbox App page).

If you want to use multiple Dropbox accounts simultaneously create each DropboxClient with this initializer:
```obj-c
DropboxClient *dropboxClient = [[DropboxClient alloc] initWithAppKey:<DropboxApp key> 
                                redirectURL:<redirectURL> 
                                restartAllTasksAfterRelaunch:YES 
                                keychainAccount:<account string>];
```

**Get access token before the first request:**
(user will see Dropbox authentication UI on this step)
```obj-c
[dropboxClient getNewTokenWithSuccess:^ { ...} fail:^(NSString * _Nonnull errorSummary) { ...}];
```
Access token will be saved to user's keychain and restored later. Don't call that method if your dropboxClient.accessToken != nil.

If you want to change Dropbox user, use this code:
```obj-c
dropboxClient.accessToken = nil;
```
And then call [dropboxClient getNewTokenWithSuccess:fail:] again.

**Use all Drobpox features like this:**
```obj-c
DropboxCommitInfo *commitInfo = [[DropboxCommitInfo alloc] initWithPath:@"/myfile.txt" 
                                mode:[[DropboxWriteMode alloc] initWithOverwrite]];
[dropboxClient.files upload:commitInfo sourceFileUrl:sourceFileURL 
progress:^(int64_t bytesSent, int64_t totalBytesSent, int64_t totalBytesExpectedToSend) {
    NSLog(@"Upload progress %lli%%", totalBytesSent/totalBytesExpectedToSend);
} success:^(DropboxFileMetadata * _Nonnull uploadResult) {
    NSLog(@"File uploaded: %@", uploadResult);
} fail:^(DropboxError * _Nonnull error) {
    NSLog(@"Upload failed with error: %@", error);
}];
```
See DropboxClient.h for all available methods.

Your download/upload tasks will remain active in background. Each download/upload method returns task object. You can cancel, suspend and resume it.

**If you want to be a good iOS citizen add these lines in your AppDelegate:**
```obj-c
- (void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler
{
    NSDictionary *userInfo = @{@"sessionIdentifier": identifier, @"completionHandler": completionHandler};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ObjectiveDropboxBackgroundSessionUpdated" object:nil userInfo:userInfo];
}
```
## Author

Mikhail Motyzhenkov, m.motyzhenkov@gmail.com

## License

ObjectiveDropbox is available under the MIT license. See the LICENSE file for more info.