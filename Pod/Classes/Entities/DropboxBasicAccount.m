//
//  DropboxBasicAccount.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxBasicAccount.h"

@implementation DropboxBasicAccount

- (instancetype)init
{
    self = [super init];
    _accountID = @"";
    _email = @"";
    _name = [DropboxName new];
    return self;
}

@end
