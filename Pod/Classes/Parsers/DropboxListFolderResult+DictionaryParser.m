//
//  DropboxListFolderResult+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 29.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxListFolderResult+DictionaryParser.h"
#import "DropboxMetadataParseManager.h"
#import "DictionaryParseHelper.h"

@implementation DropboxListFolderResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSArray *entries = [helper arrayWithKey:@"entries"];
        if (entries)
        {
            NSMutableArray *resultEntries = [NSMutableArray new];
            if ([entries isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *innerDic in entries)
                {
                    if (![innerDic isKindOfClass:[NSDictionary class]])
                    {
                        continue;
                    }
                    DropboxMetadata *metadata = [DropboxMetadataParseManager parseDic:innerDic];
                    [resultEntries addObject:metadata];
                }
            }
            self.entries = resultEntries;
        }
        
        self.cursor = [helper stringWithKey:@"cursor"];
        self.hasMore = [helper boolWithKey:@"has_more"];
    }
    return self;
}

@end
