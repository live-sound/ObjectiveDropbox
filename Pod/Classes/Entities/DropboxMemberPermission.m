//
//  DropboxMemberPermission.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxMemberPermission.h"

@implementation DropboxMemberPermission

- (instancetype)init
{
    self = [super init];
    _action = DMANotSet;
    _reason = DPDRNotSet;
    return self;
}

@end
