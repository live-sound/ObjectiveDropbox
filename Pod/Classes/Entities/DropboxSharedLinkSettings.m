//
//  DropboxSharedLinkSettings.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxSharedLinkSettings.h"

@implementation DropboxSharedLinkSettings

- (instancetype)initWithRequestedVisibility:(DropboxRequestedVisibility)visibility linkPassword:(NSString *)linkPassword expires:(NSDate *)expires
{
    self = [super init];
    _requestedVisibility = visibility;
    _linkPassword = linkPassword;
    _expires = expires;
    return self;
}

- (instancetype)init
{
    return [self initWithRequestedVisibility:DRVNotSet linkPassword:nil expires:nil];
}

@end
