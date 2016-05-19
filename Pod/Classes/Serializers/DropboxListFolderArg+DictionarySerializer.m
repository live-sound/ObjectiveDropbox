//
//  DropboxListFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderArg+DictionarySerializer.h"

@implementation DropboxListFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"path": self.path, @"recursive": @(self.recursive), @"include_media_info": @(self.includeMediaInfo), @"include_deleted": @(self.includeDeleted), @"include_has_explicit_shared_members": @(self.includeHasExplicitSharedMembers) };
}

@end
