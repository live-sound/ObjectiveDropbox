//
//  DropboxListFolderContinueArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderContinueArg+DictionarySerializer.h"

@implementation DropboxListFolderContinueArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"cursor": self.cursor};
}

@end
