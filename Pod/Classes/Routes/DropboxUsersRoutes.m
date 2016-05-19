//
//  DropboxUsersRoutes.m
//  Pods
//
//  Created by Михаил Мотыженков on 15.04.16.
//
//

#import "DropboxUsersRoutes.h"
#import "DropboxGetAccountArg+DictionarySerializer.h"
#import "DropboxBasicAccount+DictionaryParser.h"
#import "DropboxGetAccountBatchArg+DictionarySerializer.h"
#import "DropboxFullAccount+DictionaryParser.h"
#import "DropboxSpaceUsage+DictionaryParser.h"

@implementation DropboxUsersRoutes

- (void)getAccount:(DropboxGetAccountArg *)arg success:(void (^)(DropboxBasicAccount * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_account" param:arg resultType:[DropboxBasicAccount class] success:successBlock fail:failBlock];
}

- (void)getAccountBatch:(DropboxGetAccountBatchArg *)arg success:(void (^)(NSArray<DropboxBasicAccount *> * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_account_batch" param:arg resultArrayType:[DropboxBasicAccount class] success:successBlock fail:failBlock];
}

- (void)getCurrentAccountWithSuccess:(void (^)(DropboxFullAccount * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_current_account" param:nil resultType:[DropboxFullAccount class] success:successBlock fail:failBlock];
}

- (void)getSpaceUsageWithSuccess:(void (^)(DropboxSpaceUsage * _Nonnull))successBlock fail:(ErrorBlock)failBlock
{
    [self.delegate rpcEndpointWithRoute:@"get_space_usage" param:nil resultType:[DropboxSpaceUsage class] success:successBlock fail:failBlock];
}

@end
