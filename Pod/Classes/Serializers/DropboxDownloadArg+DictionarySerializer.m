//
//  DropboxDownloadArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxDownloadArg+DictionarySerializer.h"

@implementation DropboxDownloadArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path" : self.path};
}

@end
