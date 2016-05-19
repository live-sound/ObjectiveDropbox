//
//  DropboxCreateFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxCreateFolderArg+DictionarySerializer.h"

@implementation DropboxCreateFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path" : self.path};
}

@end
