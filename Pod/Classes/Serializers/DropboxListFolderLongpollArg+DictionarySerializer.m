//
//  DropboxListFolderLongpollArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderLongpollArg+DictionarySerializer.h"

@implementation DropboxListFolderLongpollArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"cursor": self.cursor, @"timeout": @(self.timeout) };
}

@end
