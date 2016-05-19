//
//  DropboxMemberPolicySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxMemberPolicySerializer.h"

@implementation DropboxMemberPolicySerializer

+ (NSString *)stringFromEnum:(DropboxMemberPolicy)policy
{
    switch (policy) {
        case DMPTeam:
            return @"team";
        case DMPAnyone:
            return @"anyone";
        default:
            return nil;
    }
}

@end
