//
//  DropboxDimensions+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxDimensions+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxDimensions (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.width = [helper uint64WithKey:@"width"];
        self.height = [helper uint64WithKey:@"height"];
    }
    
    return self;
}

@end
