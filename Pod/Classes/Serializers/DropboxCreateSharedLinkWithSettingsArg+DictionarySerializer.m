//
//  DropboxCreateSharedLinkWithSettingsArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxCreateSharedLinkWithSettingsArg+DictionarySerializer.h"
#import "DropboxSharedLinkSettings+DictionarySerializer.h"

@implementation DropboxCreateSharedLinkWithSettingsArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"path"] = self.path;
    if (self.settings)
    {
        result[@"settings"] = [self.settings dictionaryFromParams];
    }
    return result;
}

@end
