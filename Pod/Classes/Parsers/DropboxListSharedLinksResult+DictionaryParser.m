//
//  DropboxListSharedLinksResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListSharedLinksResult+DictionaryParser.h"
#import "DropboxSharedLinkMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxListSharedLinksResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.links = [helper arrayWithKey:@"links" type:[DropboxSharedLinkMetadata class]];
        self.hasMore = [helper boolWithKey:@"has_more"];
        self.cursor = [helper stringWithKey:@"cursor"];
    }
    return self;
}

@end
