//
//  DropboxListRevisionsResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListRevisionsResult+DictionaryParser.h"
#import "DropboxFileMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxListRevisionsResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.isDeleted = [helper boolWithKey:@"is_deleted"];    
    self.entries = [helper arrayWithKey:@"entries" type:[DropboxFileMetadata class]];
    
    return self;
}

@end
