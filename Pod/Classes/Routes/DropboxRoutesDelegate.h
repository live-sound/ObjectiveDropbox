//
//  DropboxRoutesDelegate.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.05.16.
//
//

#import <Foundation/Foundation.h>
#import "DictionarySerializer.h"
#import "DropboxDefines.h"
#import "DictionaryParseManager.h"
#import "DictionaryParser.h"
#import "DropboxUrlSessionHandlers.h"
#import "DropboxUploadTask.h"
#import "DropboxDownloadTask.h"

@protocol DropboxRoutesDelegate <NSObject>

@property (nonatomic, nonnull) NSString *path;

- (void)rpcEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nullable)arg resultType:(Class<DictionaryParser> _Nullable)resultType success:(void (^ _Nullable)(id<DictionaryParser> _Nullable result))successBlock fail:(nullable ErrorBlock)failBlock;

- (void)rpcEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nonnull)arg parseManager:(Class<DictionaryParseManager> _Nullable)parseManager success:(void (^ _Nullable)(id<DictionaryParser> _Nullable))successBlock fail:(nullable ErrorBlock)failBlock;

- (void)rpcEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nullable)arg resultArrayType:(Class<DictionaryParser> _Nullable)resultType success:(void (^ _Nullable)(NSArray<DictionaryParser> * _Nullable result))successBlock fail:(nullable ErrorBlock)failBlock;

- (void)rpcEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nullable)arg success:(void (^ _Nullable)(void))successBlock fail:(nullable ErrorBlock)failBlock;

- (DropboxUploadTask * _Nonnull)contentUploadEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nullable)arg fileUrl:(NSURL * _Nonnull)fileUrl resultType:(Class<DictionaryParser> _Nullable)resultType progress:(nullable DownloadTaskProgressHandler)progressBlock success:(void (^ _Nullable)(id<DictionaryParser> _Nullable))successBlock fail:(nullable ErrorBlock)failBlock;

- (DropboxDownloadTask * _Nonnull)contentDownloadEndpointWithRoute:(NSString * _Nonnull)route param:(id<DictionarySerializer> _Nullable)arg destinationFileUrl:(NSURL * _Nonnull)destUrl resultType:(Class<DictionaryParser> _Nullable)resultType progress:(nullable DownloadTaskProgressHandler)progressBlock success:(void (^ _Nullable)(id<DictionaryParser> _Nullable))successBlock fail:(nullable ErrorBlock)failBlock;

@end