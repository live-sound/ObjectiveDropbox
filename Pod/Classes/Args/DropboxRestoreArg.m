//
//  DropboxRestoreArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 20.04.16.
//
//

#import "DropboxRestoreArg.h"

@implementation DropboxRestoreArg

- (instancetype)initWithPath:(NSString *)path rev:(NSString *)rev
{
    self = [self init];
    _path = path;
    _rev = rev;
    return self;
}

@end
