//
//  DropboxGetTemporaryLinkResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 18.04.16.
//
//

#import "DropboxGetTemporaryLinkResult+DictionaryParser.h"
#import "DropboxFileMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxGetTemporaryLinkResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        id meta = [helper dictionaryWithKey:@"metadata"];
        if (meta)
        {
            self.metadata = [[DropboxFileMetadata alloc] initWithDictionary:meta];
        }
        
        self.link = [helper stringWithKey:@"link"];
    }
    return self;
}

@end
