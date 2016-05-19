//
//  DropboxGetTemporaryLinkArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetTemporaryLinkArg+DictionarySerializer.h"

@implementation DropboxGetTemporaryLinkArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path" : self.path};
}

@end
