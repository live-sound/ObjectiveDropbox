//
//  DropboxInviteeInfoParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxInviteeInfoEnumParser.h"

@implementation DropboxInviteeInfoEnumParser

+ (DropboxInviteeInfoEnum)inviteeInfoFromString:(NSString *)string
{
    if ([string isEqualToString:@"email"])
    {
        return DIIEmail;
    }
    return DIINotSet;
}

@end
