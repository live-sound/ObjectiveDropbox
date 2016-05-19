//
//  DropboxGetSharedLinkMetadataArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxGetSharedLinkMetadataArg : NSObject

/**
 *  URL of the shared link.
 */
@property (nonatomic, nonnull) NSString *url;

/**
 *  If the shared link is to a folder, this parameter can be used to retrieve the metadata for a specific file or sub-folder in this folder. A relative path should be used. This field is optional.
 */
@property (nonatomic, nullable) NSString *path;

/**
 *  If the shared link has a password, this parameter can be used. This field is optional.
 */
@property (nonatomic, nullable) NSString *linkPassword;

- (nonnull instancetype)initWithUrl:(NSString * _Nonnull)url path:(NSString * _Nullable)path linkPassword:(NSString * _Nullable)linkPassword;

- (nonnull instancetype)initWithUrl:(NSString * _Nonnull)url;

@end
