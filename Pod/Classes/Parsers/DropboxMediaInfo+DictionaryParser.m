//
//  DropboxMediaInfo+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaInfo+DictionaryParser.h"
#import "DropboxMediaMetadataParseManager.h"
#import "DictionaryParseHelper.h"
#import "DropboxDefines.h"

@implementation DropboxMediaInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id pending = dic[@"pending"];
    self.isPending = NotNull(pending);
    
    if (!self.isPending)    
    {
        id meta = [helper dictionaryWithKey:@"metadata"];
        if (meta)
        {
            self.metadata = [DropboxMediaMetadataParseManager initMediaMetadataWithDictionary:meta];
        }
    }
    
    return self;
}

@end
