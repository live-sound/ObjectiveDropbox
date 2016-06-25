//
//  DropboxName.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxName.h"

@implementation DropboxName

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _givenName = _surname = _familiarName = _displayName = @"";
    }
    return self;
}

@end
