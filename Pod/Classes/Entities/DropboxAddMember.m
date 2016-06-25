//
//  DropboxAddMember.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAddMember.h"

@implementation DropboxAddMember

- (instancetype)initWithMember:(DropboxMemberSelector *)member accessLevel:(DropboxAccessLevel)accessLevel
{
    self = [super init];
    if (self) {
        _member = member;
        _accessLevel = accessLevel;
    }
    return self;
}

@end
