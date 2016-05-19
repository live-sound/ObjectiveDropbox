//
//  DropboxGetMetadataArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetMetadataArg+DictionarySerializer.h"

@implementation DropboxGetMetadataArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path" : self.path, @"include_media_info" : @(self.includeMediaInfo), @"include_deleted" : @(self.includeDeleted)};
}

@end
