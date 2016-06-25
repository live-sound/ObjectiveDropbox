//
//  DropboxGroupInfo.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxGroupInfo.h"

@implementation DropboxGroupInfo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _groupType = DGTNotSet;
        _memberCount = -1;
    }    
    return self;
}

@end
