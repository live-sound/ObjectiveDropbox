//
//  DropboxRestoreArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 20.04.16.
//
//

#import "DropboxRestoreArg+DictionarySerializer.h"

@implementation DropboxRestoreArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path": self.path,
             @"rev": self.rev };
}

@end
