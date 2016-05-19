//
//  DropboxMetadata+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.name = [helper stringWithKey:@"name"];
    self.pathLower = [helper stringWithKey:@"path_lower"];
    self.pathDisplay = [helper stringWithKey:@"path_display"];
    
    return self;
}

@end
