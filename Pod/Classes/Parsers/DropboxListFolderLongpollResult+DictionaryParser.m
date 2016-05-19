//
//  DropboxListFolderLongpollResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderLongpollResult+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxListFolderLongpollResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.changes = [helper boolWithKey:@"changes"];
    self.backoff = [helper numberWithKey:@"backoff"];
    
    return self;
}

@end
