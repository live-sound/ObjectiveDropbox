//
//  DropboxListFolderMembersContinueArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFolderMembersContinueArg+DictionarySerializer.h"

@implementation DropboxListFolderMembersContinueArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    if (!self.cursor)
    {
        return @{};
    }
    return @{ @"cursor": self.cursor };
}

@end
