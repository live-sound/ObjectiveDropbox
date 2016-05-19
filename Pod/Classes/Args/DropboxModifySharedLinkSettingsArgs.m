//
//  DropboxModifySharedLinkSettingsArgs.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxModifySharedLinkSettingsArgs.h"

@implementation DropboxModifySharedLinkSettingsArgs

- (instancetype)initWithURL:(NSString *)url settings:(DropboxSharedLinkSettings *)settings removeExpiration:(BOOL)removeExpiration
{
    self = [self init];
    
    _url = url;
    _settings = settings;
    _removeExpiration = removeExpiration;
    
    return self;
}

- (instancetype)initWithURL:(NSString *)url settings:(DropboxSharedLinkSettings *)settings
{
    return [self initWithURL:url settings:settings removeExpiration:NO];
}

- (instancetype)init
{
    self = [super init];
    _url = @"";
    return self;
}

@end
