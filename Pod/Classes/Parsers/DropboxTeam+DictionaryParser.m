//
//  DropboxTeam+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxTeam+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxTeam (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.ID = [helper stringWithKey:@"id"];    
    self.name = [helper stringWithKey:@"name"];
    
    return self;
}

@end
