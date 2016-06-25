//
//  DropboxGetSharedLinkMetadataArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxGetSharedLinkMetadataArg.h"

@implementation DropboxGetSharedLinkMetadataArg

- (instancetype)initWithUrl:(NSString *)url path:(NSString *)path linkPassword:(NSString *)linkPassword
{
    self = [super init];
    if (self) {
        _url = url;
        _path = path;
        _linkPassword = linkPassword;
    }
    return self;
}

- (instancetype)initWithUrl:(NSString *)url
{
    return [self initWithUrl:url path:nil linkPassword:nil];
}

@end
