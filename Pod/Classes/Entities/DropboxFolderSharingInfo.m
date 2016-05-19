//
//  DropboxFolderSharingInfo.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFolderSharingInfo.h"

@implementation DropboxFolderSharingInfo

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ sharedFolderID: %@ }", self.sharedFolderID];
}

@end
