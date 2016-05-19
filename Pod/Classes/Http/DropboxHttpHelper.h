//
//  DropboxHttpHelper.h
//  Pods
//
//  Created by Михаил Мотыженков on 13.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRoutes.h"
#import "DropboxUrlSessionDelegateProtocol.h"

@interface DropboxHttpHelper : NSObject <DropboxRoutesDelegate>

@property (nonatomic, nonnull) NSString *accessToken;
@property (nonatomic, nonnull) NSString *hostRpc;
@property (nonatomic, nonnull) NSString *hostUpload;
@property (nonatomic, nonnull) NSString *hostDownload;
@property (nonatomic, nonnull) NSString *path;
@property (nonatomic, weak, nullable) NSURLSession *dataSession;
@property (nonatomic, weak, nullable) NSURLSession *backgroundSession;
@property (nonatomic, weak, nullable) id<DropboxUrlSessionDelegateProtocol> sessionDelegate;

@end
