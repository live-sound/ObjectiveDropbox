//
//  DropboxRelocationArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxRelocationArg+DictionarySerializer.h"

@implementation DropboxRelocationArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"from_path" : self.fromPath,
             @"to_path" : self.toPath};
}

@end
