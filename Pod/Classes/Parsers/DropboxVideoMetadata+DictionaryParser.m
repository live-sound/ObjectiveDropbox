//
//  DropboxVideoMetadata+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxVideoMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxVideoMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.duration = [helper uint64WithKey:@"duration"];
    
    return self;
}

@end
