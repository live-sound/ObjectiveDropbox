//
//  DropboxTeamSpaceAllocation+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxTeamSpaceAllocation+DictionaryParser.h"
#import "DropboxBaseSpaceAllocation+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxTeamSpaceAllocation (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.used = [helper uint64WithKey:@"used"];
    
    return self;
}

@end
