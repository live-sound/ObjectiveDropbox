//
//  DropboxModifySharedLinkSettingsArgs+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxModifySharedLinkSettingsArgs+DictionarySerializer.h"
#import "DropboxSharedLinkSettings+DictionarySerializer.h"

@implementation DropboxModifySharedLinkSettingsArgs (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"url": self.url,
              @"settings": [self.settings dictionaryFromParams],
              @"remove_expiration": @(self.removeExpiration) };
}

@end
