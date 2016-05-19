//
//  DropboxRemoveFolderMemberArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxRemoveFolderMemberArg+DictionarySerializer.h"
#import "DropboxMemberSelector+DictionarySerializer.h"

@implementation DropboxRemoveFolderMemberArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID,
              @"member": [self.member dictionaryFromParams],
              @"leave_a_copy": @(self.leaveACopy) };
}

@end
