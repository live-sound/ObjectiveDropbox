//
//  DropboxSpaceUsage+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSpaceUsage+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxSpaceAllocation+DictionaryParser.h"

@implementation DropboxSpaceUsage (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.used = [helper uint64WithKey:@"used"];
    
    NSDictionary *allocation = [helper dictionaryWithKey:@"allocation"];
    if (allocation)
    {
        self.allocation = [[DropboxSpaceAllocation alloc] initWithDictionary:allocation];
    }
    
    return self;
}

@end
