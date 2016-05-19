//
//  DropboxMountFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxMountFolderArg+DictionarySerializer.h"

@implementation DropboxMountFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID };
}

@end
