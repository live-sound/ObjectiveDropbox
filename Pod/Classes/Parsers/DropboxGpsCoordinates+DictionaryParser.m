//
//  DropboxGpsCoordinates+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxGpsCoordinates+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxGpsCoordinates (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.latitude = [helper float64WithKey:@"latitude"];
    self.longitude = [helper float64WithKey:@"longitude"];
    
    return self;
}

@end
