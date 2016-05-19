//
//  DropboxFileSharingInfo.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFileSharingInfo.h"

@implementation DropboxFileSharingInfo

- (NSString *)description
{
    NSMutableString *result = [NSMutableString new];
    [result appendString:@"\n(\n"];
    
    [result appendFormat:@"readOnly: %i\n", self.readOnly];
    [result appendFormat:@"parentSharedFolderID: %@\n", self.parentSharedFolderID];
    if (self.modifiedBy)
    {
        [result appendFormat:@"modifiedBy: %@\n", self.modifiedBy];
    }
    
    [result appendString:@")\n"];
    return result;
}

@end
