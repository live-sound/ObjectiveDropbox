//
//  DropboxBaseSpaceAllocation+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxBaseSpaceAllocation+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxBaseSpaceAllocation (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.allocated = [helper uint64WithKey:@"allocated"];
    return self;
}

@end
