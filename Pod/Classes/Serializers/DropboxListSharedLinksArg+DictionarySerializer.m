//
//  DropboxListSharedLinksArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListSharedLinksArg+DictionarySerializer.h"

@implementation DropboxListSharedLinksArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    if (self.path)
    {
        result[@"path"] = self.path;
    }
    if (self.cursor)
    {
        result[@"cursor"] = self.cursor;
    }
    if (self.directOnly)
    {
        result[@"direct_only"] = @(self.directOnly);
    }
    
    return [result copy];
}

@end
