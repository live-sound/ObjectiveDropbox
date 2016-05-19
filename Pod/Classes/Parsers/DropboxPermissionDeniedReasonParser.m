//
//  DropboxPermissionDeniedReasonParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxPermissionDeniedReasonParser.h"

@implementation DropboxPermissionDeniedReasonParser

+ (DropboxPermissionDeniedReason)permissionDeniedReasonFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"user_not_same_team_as_owner"])
    {
        return DPDRUserNotSameTeamAsOwner;
    }
    else if ([string isEqualToString:@"user_not_allowed_by_owner"])
    {
        return DPDRUserNotAllowedByOwner;
    }
    else if ([string isEqualToString:@"target_is_indirect_member"])
    {
        return DPDRTargetIsIndirectMember;
    }
    else if ([string isEqualToString:@"target_is_owner"])
    {
        return DPDRTargetIsOwner;
    }
    else if ([string isEqualToString:@"target_is_self"])
    {
        return DPDRTargetIsSelf;
    }
    else if ([string isEqualToString:@"target_not_active"])
    {
        return DPDRTargetNotActive;
    }
    return DPDRNotSet;
}

@end
