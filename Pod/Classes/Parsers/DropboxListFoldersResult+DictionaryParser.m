//
//  DropboxListFoldersArgs+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFoldersResult+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxSharedFolderMetadata+DictionaryParser.h"

@implementation DropboxListFoldersResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.entries = [helper arrayWithKey:@"entries" type:[DropboxSharedFolderMetadata class]];
        self.cursor = [helper stringWithKey:@"cursor"];
    }
    return self;
}

@end
