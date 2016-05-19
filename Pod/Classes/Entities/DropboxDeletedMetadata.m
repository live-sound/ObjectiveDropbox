//
//  DropboxDeletedMetadata.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxDeletedMetadata.h"

@implementation DropboxDeletedMetadata

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"DeletedMetadata: { "];
    
    [result appendFormat:@"name: %@; ", self.name];
    [result appendFormat:@"pathLower: %@; ", self.pathLower];
    [result appendFormat:@"pathDisplay: %@; ", self.pathDisplay];
    
    [result appendString:@" }"];
    return result;
}

@end
