//
//  DropboxMediaMetadata+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMediaMetadata+DictionaryParser.h"
#import "DropboxDimensions+DictionaryParser.h"
#import "DropboxGpsCoordinates+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxMediaMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id dimensions = [helper dictionaryWithKey:@"dimensions"];
    if (dimensions)
    {
        self.dimensions = [[DropboxDimensions alloc] initWithDictionary:dimensions];
    }
    
    id location = [helper dictionaryWithKey:@"location"];
    if (location)
    {
        self.location = [[DropboxGpsCoordinates alloc] initWithDictionary:location];
    }
    
    self.timeTaken = [helper dateWithKey:@"time_taken"];    
   
    return self;
}

@end
