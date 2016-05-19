//
//  DropboxRevokeSharedLinkArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxRevokeSharedLinkArg : NSObject

/**
 *  URL of the shared link.
 */
@property (nonatomic, nonnull) NSString *url;


- (nonnull instancetype)initWithURL:(NSString * _Nonnull)url;

@end
