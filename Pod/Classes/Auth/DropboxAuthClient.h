//
//  DropboxAuthClient.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAuthViewControllerProtocol.h"
#import "DropboxAuthClientProtocol.h"

@interface DropboxAuthClient : NSObject <DropboxAuthClientProtocol>

@property (nonatomic, weak, nullable) UIViewController<DropboxAuthViewControllerProtocol> *authViewController;
@property (nonatomic, weak, nullable) id<DropboxAuthClientDelegate> delegate;

- (nonnull instancetype)initWithDelegate:(id<DropboxAuthClientDelegate> _Nonnull)delegate;

@end
