//
//  DropboxRoutes.m
//  Pods
//
//  Created by Михаил Мотыженков on 01.04.16.
//
//

#import "DropboxRoutes.h"


@implementation DropboxRoutes


- (instancetype)initWithPath:(NSString *)path
{
    self = [self init];
    if (self) {
        _path = path;
    }
    return self;
}

- (instancetype)initWithPath:(NSString *)path andWithDelegate:(id<DropboxRoutesDelegate>)delegate
{
    self = [self initWithPath:path];
    if (self) {
        _delegate = delegate;
        _delegate.path = _path;
    }
    return self;
}

@end
