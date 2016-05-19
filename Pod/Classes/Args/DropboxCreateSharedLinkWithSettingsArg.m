//
//  DropboxCreateSharedLinkWithSettingsArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxCreateSharedLinkWithSettingsArg.h"

@implementation DropboxCreateSharedLinkWithSettingsArg

- (instancetype)initWithPath:(NSString *)path settings:(DropboxSharedLinkSettings *)settings
{
    self = [super init];
    _path = path;
    _settings = settings;
    return self;
}

- (instancetype)initWithPath:(NSString *)path
{
    return [self initWithPath:path settings:nil];
}

@end
