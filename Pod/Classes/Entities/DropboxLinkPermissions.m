//
//  DropboxLinkPermissions.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxLinkPermissions.h"

@implementation DropboxLinkPermissions

- (instancetype)init
{
    self = [super init];
    _resolvedVisibility = DResolvedVisibilityNotSet;
    _requestedVisibility = DRVNotSet;
    _revokeFailureReason = DSLAFRNotSet;
    return self;
}

@end
