//
//  DropboxDeleteArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxDeleteArg+DictionarySerializer.h"

@implementation DropboxDeleteArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path": self.path};
}

@end
