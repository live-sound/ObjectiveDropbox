//
//  DropboxListFolderGetLatestCursorResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderGetLatestCursorResult+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxListFolderGetLatestCursorResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.cursor = [helper stringWithKey:@"cursor"];
    }
    return self;
}

@end
