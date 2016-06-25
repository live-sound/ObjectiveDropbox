//
//  DropboxRevokeSharedLinkArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxRevokeSharedLinkArg.h"

@implementation DropboxRevokeSharedLinkArg

- (instancetype)initWithURL:(NSString *)url
{
    self = [super init];
    if (self) {
        _url = url;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithURL:@""];
}

@end
