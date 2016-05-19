//
//  DropboxListRevisionsArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListRevisionsArg+DictionarySerializer.h"

@implementation DropboxListRevisionsArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"path": self.path, @"limit": @(self.limit) };
}

@end
