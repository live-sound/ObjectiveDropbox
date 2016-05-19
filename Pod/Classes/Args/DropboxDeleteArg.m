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
    _path = path;
    return self;
}

@end
