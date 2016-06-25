//
//  DropboxRelocationArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxRelocationArg.h"

@implementation DropboxRelocationArg

- (instancetype)initWithFromPath:(NSString *)fromPath toPath:(NSString *)toPath
{
    self = [self init];
    if (self) {
        _fromPath = fromPath;
        _toPath = toPath;
    }
    return self;
}

@end
