//
//  DropboxUpdateFolderMemberArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUpdateFolderMemberArg+DictionarySerializer.h"
#import "DropboxMemberSelector+DictionarySerializer.h"
#import "DropboxAccessLevelDictionarySerializer.h"

@implementation DropboxUpdateFolderMemberArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID,
              @"member": [self.member dictionaryFromParams],
              @"access_level": [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:self.accessLevel]
              };
}

@end
