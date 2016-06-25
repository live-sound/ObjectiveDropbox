//
//  DropboxCreateFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxCreateFolderArg.h"

@implementation DropboxCreateFolderArg

- (instancetype)initWithPath:(NSString *)path
{
    self = [self init];
    if (self) {
        _path = path;
    }
    return self;
}

@end
