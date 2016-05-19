//
//  DropboxFolderPolicy.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxFolderPolicy.h"

@implementation DropboxFolderPolicy

- (instancetype)init
{
    self = [super init];
    _memberPolicy = _resolvedMemberPolicy = DMPNotSet;
    _aclUpdatePolicy = DAUPNotSet;
    _sharedLinkPolicy = DSLPNotSet;
    return self;
}

@end
