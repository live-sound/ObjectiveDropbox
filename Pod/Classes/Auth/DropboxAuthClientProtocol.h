//
//  DropboxAuthClientProtocol.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAuthDelegate.h"
#import "DropboxAuthViewControllerProtocol.h"

@protocol DropboxAuthClientProtocol <DropboxAuthDelegate>

- (void)getNewTokenWithAuthViewController:(nonnull UIViewController<DropboxAuthViewControllerProtocol> *)authViewController success:(void (^ _Nonnull)(NSString * _Nonnull))success fail:(void (^ _Nonnull)(NSString * _Nonnull))fail;

@end


@protocol DropboxAuthClientDelegate <NSObject>

- (void)authClient:(id<DropboxAuthClientProtocol> _Nonnull)authClient didReceiveToken:(NSString * _Nonnull)token;

@end
