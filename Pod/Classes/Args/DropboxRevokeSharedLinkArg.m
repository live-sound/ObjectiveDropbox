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
    _url = url;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _url = @"";
    return self;
}

@end
