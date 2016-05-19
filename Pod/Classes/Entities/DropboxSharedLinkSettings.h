//
//  DropboxSharedLinkSettings.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxRequestedVisibility.h"

@interface DropboxSharedLinkSettings : NSObject

/**
 *  The requested access for this shared link. This field is optional.
 */
@property (nonatomic) DropboxRequestedVisibility requestedVisibility;

/**
 *  If requested_visibility is RequestedVisibility.password this is needed to specify the password to access the link. This field is optional.
 */
@property (nonatomic, nullable) NSString *linkPassword;

/**
 *  Expiration time of the shared link. By default the link won't expire. This field is optional.
 */
@property (nonatomic, nullable) NSDate *expires;

- (nonnull instancetype)initWithRequestedVisibility:(DropboxRequestedVisibility)visibility linkPassword:(NSString * _Nullable)linkPassword expires:(NSDate * _Nullable)expires;

@end
