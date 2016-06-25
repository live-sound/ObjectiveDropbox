//
//  DropboxSpaceAllocation.m
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxSpaceAllocation.h"

@implementation DropboxSpaceAllocation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _type = DSANotSet;
    }
    return self;
}

@end
