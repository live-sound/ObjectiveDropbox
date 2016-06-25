//
//  DropboxGetSharedLinkMetadataArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxGetSharedLinkMetadataArg+DictionarySerializer.h"

@implementation DropboxGetSharedLinkMetadataArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"url"] = self.url;
    if (self.path)
    {
        result[@"path"] = self.path;
    }
    if (self.linkPassword)
    {
        result[@"link_password"] = self.linkPassword;
    }
    
    return [result copy];
}

@end
