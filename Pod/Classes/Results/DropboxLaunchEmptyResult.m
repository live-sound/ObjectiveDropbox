//
//  DropboxLaunchEmptyResult.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxLaunchEmptyResult.h"

@implementation DropboxLaunchEmptyResult

- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = DLERNotSet;
        _value = @"";
    }
    return self;
}

@end
