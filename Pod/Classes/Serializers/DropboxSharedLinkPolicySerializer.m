//
//  DropboxSharedLinkPolicySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxSharedLinkPolicySerializer.h"

@implementation DropboxSharedLinkPolicySerializer

+ (NSString *)stringFromEnum:(DropboxSharedLinkPolicy)policy
{
    switch (policy) {
        case DSLPAnyone:
            return @"anyone";
        case DSLPMembers:
            return @"members";
        default:
            return nil;
    }
}

@end
