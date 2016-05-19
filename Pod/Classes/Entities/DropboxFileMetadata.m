//
//  DropboxFileMetadata.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFileMetadata.h"

@implementation DropboxFileMetadata

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"FileMetadata: { "];
    
    [result appendFormat:@"name: %@; ", self.name];
    [result appendFormat:@"pathLower: %@; ", self.pathLower];
    [result appendFormat:@"pathDisplay: %@; ", self.pathDisplay];
    [result appendFormat:@"clientModified: %@; ", self.clientModified];
    [result appendFormat:@"serverModified: %@; ", self.serverModified];
    [result appendFormat:@"rev: %@; ", self.rev];
    [result appendFormat:@"size: %llu bytes; ", self.size];
    [result appendFormat:@"id: %@; ", self.id];
    if (self.mediaInfo)
    {
        [result appendFormat:@"mediaInfo: %@; ", self.mediaInfo];
    }
    if (self.sharingInfo)
    {
        [result appendFormat:@"sharingInfo: %@; ", self.sharingInfo];
    }
    
    [result appendString:@"}"];
    return result;
}

@end
