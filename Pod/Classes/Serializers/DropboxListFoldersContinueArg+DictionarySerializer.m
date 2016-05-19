//
//  DropboxListFoldersContinueArgs+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFoldersContinueArg+DictionarySerializer.h"

@implementation DropboxListFoldersContinueArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"cursor": self.cursor };
}

@end
