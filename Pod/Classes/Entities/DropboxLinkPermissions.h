//
//  DropboxLinkPermissions.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxResolvedVisibility.h"
#import "DropboxRequestedVisibility.h"
#import "DropboxSharedLinkAccessFailureReason.h"

@interface DropboxLinkPermissions : NSObject

@property (nonatomic) BOOL canRevoke;
@property (nonatomic) DropboxResolvedVisibility resolvedVisibility;
@property (nonatomic) DropboxRequestedVisibility requestedVisibility;
@property (nonatomic) DropboxSharedLinkAccessFailureReason revokeFailureReason;

@end
