//
//  DropboxRelinquishFolderMembershipArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxRelinquishFolderMembershipArg+DictionarySerializer.h"

@implementation DropboxRelinquishFolderMembershipArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"shared_folder_id": self.sharedFolderID };
}

@end
