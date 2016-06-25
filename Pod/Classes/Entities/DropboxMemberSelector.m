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
    return [self initWithType:DMSEmail value:email];
}

- (instancetype)initWithDropboxID:(NSString *)dropboxID
{
    return [self initWithType:DMSDropboxID value:dropboxID];
}

- (instancetype)initWithType:(DropboxMemberSelectorEnum)type value:(NSString *)value
{
    self = [super init];
    if (self) {
        _type = type;
        _value = value;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithType:DMSNotSet value:@""];
}

@end
