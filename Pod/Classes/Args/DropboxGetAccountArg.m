//
//  DropboxGetAccountArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxGetAccountArg.h"

@implementation DropboxGetAccountArg

- (instancetype)initWithAccountID:(NSString *)accountID
{
    self = [super init];
    if (self) {
        _accountID = accountID;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithAccountID:@""];
}

@end
