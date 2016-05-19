//
//  DropboxTransferFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxTransferFolderArg+DictionarySerializer.h"

@implementation DropboxTransferFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID,
              @"to_dropbox_id": self.toDropboxID };
}

@end
