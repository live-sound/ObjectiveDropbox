//
//  DropboxAuthRoutes.h
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRoutes.h"

@interface DropboxAuthRoutes : DropboxRoutes

- (void)tokenRevokeWithSuccessBlock:(nullable void(^)())successBlock failBlock:(nullable ErrorBlock)failBlock;

@end
