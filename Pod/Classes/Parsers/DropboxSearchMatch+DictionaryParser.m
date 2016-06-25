//
//  DropboxSearchMatch+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchMatch+DictionaryParser.h"
#import "DropboxSearchMatchTypeParseManager.h"
#import "DropboxMetadataParseManager.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSearchMatch (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        id matchType = [helper dictionaryWithKey:@"match_type"];
        if (matchType)
        {
            self.matchType = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:matchType];
        }
        
        id meta = [helper dictionaryWithKey:@"metadata"];
        if (meta)
        {
            self.metadata = [DropboxMetadataParseManager parseDic:meta];
        }
    }
    return self;
}

@end
