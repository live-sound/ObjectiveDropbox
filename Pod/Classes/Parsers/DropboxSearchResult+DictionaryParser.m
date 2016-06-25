//
//  DropboxSearchResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchResult+DictionaryParser.h"
#import "DropboxSearchMatch+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSearchResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.matches = [helper arrayWithKey:@"matches" type:[DropboxSearchMatch class]];    
        self.more = [helper boolWithKey:@"more"];
        self.start = [helper uint64WithKey:@"start"];
    }
    return self;
}

@end
