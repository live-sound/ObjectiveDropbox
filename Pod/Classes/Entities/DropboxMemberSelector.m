//
//  DropboxMemberSelector.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxMemberSelector.h"

@implementation DropboxMemberSelector

- (instancetype)initWithEmail:(NSString *)email
{
    self = [super init];
    _type = DMSEmail;
    _value = email;
    return self;
}

- (instancetype)initWithDropboxID:(NSString *)dropboxID
{
    self = [super init];
    _type = DMSDropboxID;
    _value = dropboxID;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _type = DMSNotSet;
    _value = @"";
    return self;
}

@end
