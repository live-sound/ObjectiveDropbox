//
//  DropboxSearchArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchArg+DictionarySerializer.h"
#import "DropboxSearchModeStringSerializer.h"

@implementation DropboxSearchArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSString *mode = [DropboxSearchModeStringSerializer stringFromEnum:self.mode];
    return @{@"path": self.path,
             @"query": self.query,
             @"start": @(self.start),
             @"max_results": @(self.maxResults),
             @"mode": mode};
}

@end
