//
//  DropboxUsersRoutes.h
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRoutes.h"
#import "DropboxGetAccountArg.h"
#import "DropboxBasicAccount.h"
#import "DropboxGetAccountBatchArg.h"
#import "DropboxFullAccount.h"
#import "DropboxSpaceUsage.h"

@interface DropboxUsersRoutes : DropboxRoutes

/**
 *  Get information about a user's account.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)getAccount:(DropboxGetAccountArg * _Nonnull)arg success:(void(^ _Nullable)(DropboxBasicAccount * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get information about multiple user accounts. At most 300 accounts may be queried per request.
 *
 *  @param arg
 *  @param successBlock
 *  @param failBlock
 */
- (void)getAccountBatch:(DropboxGetAccountBatchArg * _Nonnull)arg success:(void(^ _Nullable)(NSArray<DropboxBasicAccount *> * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get information about the current user's account.
 *
 *  @param successBlock
 *  @param failBlock    
 */
- (void)getCurrentAccountWithSuccess:(void(^ _Nullable)(DropboxFullAccount * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

/**
 *  Get the space usage information for the current user's account.
 *
 *  @param successBlock
 *  @param failBlock    
 */
- (void)getSpaceUsageWithSuccess:(void(^ _Nullable)(DropboxSpaceUsage * _Nonnull result))successBlock fail:(nullable ErrorBlock)failBlock;

@end
