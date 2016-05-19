//
//  DropboxUploadSessionStartArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionStartArg+DictionarySerializer.h"

@implementation DropboxUploadSessionStartArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"close": @(self.close) };
}

@end
