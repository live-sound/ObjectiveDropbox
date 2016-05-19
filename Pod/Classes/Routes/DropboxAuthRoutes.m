//
//  DropboxAuthRoutes.m
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import "DropboxAuthRoutes.h"
#import "ObjectiveDropboxError.h"

@implementation DropboxAuthRoutes

- (void)tokenRevokeWithSuccessBlock:(void (^)())successBlock failBlock:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"token/revoke" param:nil success:successBlock fail:failBlock];
}

@end
