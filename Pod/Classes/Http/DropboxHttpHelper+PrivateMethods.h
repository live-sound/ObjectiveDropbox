//
//  DropboxHttpHelper+PrivateMethods.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxHttpHelper.h"

@interface DropboxHttpHelper (PrivateMethods)

+ (void)handleDropboxRequestErrorWithStatusCode:(NSInteger)statusCode outputContent:(NSData * _Nullable)outputContent outputHeadersDic:(NSDictionary * _Nullable)outputHeadersDic errorBlock:(nullable ErrorBlock)errorBlock;
+ (NSString * _Nonnull)jsonStringWithDictionary:(NSDictionary * _Nonnull)dic;
+ (NSURL * _Nonnull)urlWithHost:(NSString * _Nonnull)host path:(NSString * _Nonnull)path method:(NSString * _Nonnull)method;
+ (NSString * _Nonnull)stringWithUnicharsFromString:(NSString * _Nonnull)string;

@end