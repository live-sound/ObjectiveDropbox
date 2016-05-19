//
//  DropboxPreviewArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetPreviewArg+DictionarySerializer.h"

@implementation DropboxGetPreviewArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"path" : self.path};
}

@end
