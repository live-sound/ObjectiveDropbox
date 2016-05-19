//
//  DropboxFolderMetadata.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFolderMetadata.h"

@implementation DropboxFolderMetadata

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"FolderMetadata: { "];
    [result appendFormat:@"name: %@; ", self.name];
    [result appendFormat:@"pathLower: %@; ", self.pathLower];
    [result appendFormat:@"pathDisplay: %@; ", self.pathDisplay];
    [result appendFormat:@"id: %@", self.id];
    if (self.sharingInfo)
    {
        [result appendFormat:@" sharingInfo: %@", self.sharingInfo];
    }
    [result appendString:@" }"];
    return result;
}

@end
