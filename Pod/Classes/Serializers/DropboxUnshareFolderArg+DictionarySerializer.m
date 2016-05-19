//
//  DropboxUnshareFolderArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUnshareFolderArg+DictionarySerializer.h"

@implementation DropboxUnshareFolderArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID,
              @"leave_a_copy": @(self.leaveACopy) };
}

@end
