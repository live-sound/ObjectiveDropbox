//
//  DropboxRequestedVisibilityDictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxRequestedVisibilityStringSerializer.h"

@implementation DropboxRequestedVisibilityStringSerializer

+ (NSString *)stringFromEnum:(DropboxRequestedVisibility)visibility
{
    switch (visibility) {
        case DRVPublic:
            return @"public";
        case DRVPassword:
            return @"password";
        case DRVTeamOnly:
            return @"team_only";
        case DRVNotSet:
            return @"not_set";
        default:
            return @"unknown";
    }
}

@end
