//
//  DropboxFolderPermission.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxFolderPermission.h"

@implementation DropboxFolderPermission

- (instancetype)init
{
    self = [super init];
    _action = DFANotSet;
    _reason = DPDRNotSet;
    return self;
}

@end
