//
//  DropboxRevokeSharedLinkArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxRevokeSharedLinkArg+DictionarySerializer.h"

@implementation DropboxRevokeSharedLinkArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"url": self.url };
}

@end
