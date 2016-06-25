//
//  DropboxDeleteArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxDeleteArg.h"

@implementation DropboxDeleteArg

- (instancetype)initWithPath:(NSString *)path
{
    self = [self init];
    if (self) {
        _path = path;
    }
    return self;
}

@end
