//
//  DropboxAuthClientProtocol.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAuthDelegate.h"


@protocol DropboxAuthClientProtocol <DropboxAuthDelegate>

- (void)getNewTokenWithSuccess:(void(^ _Nullable)(NSString * _Nonnull token))success fail:(void(^ _Nullable)(NSString * _Nonnull errorSummary))fail;

@end


@protocol DropboxAuthClientDelegate <NSObject>

- (void)authClient:(id<DropboxAuthClientProtocol> _Nonnull)authClient didReceiveToken:(NSString * _Nonnull)token;

@end
