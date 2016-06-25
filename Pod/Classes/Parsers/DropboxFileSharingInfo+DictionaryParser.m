//
//  DropboxFileSharingInfo+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFileSharingInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFileSharingInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.modifiedBy = [helper stringWithKey:@"modified_by"];
    }
    return self;
}

@end
