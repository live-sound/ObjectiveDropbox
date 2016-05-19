//
//  DropboxUnmountFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUnmountFolderArg+DictionarySerializer.h"

@implementation DropboxUnmountFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID };
}

@end
