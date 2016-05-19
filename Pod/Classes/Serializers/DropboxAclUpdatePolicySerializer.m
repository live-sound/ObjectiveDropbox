//
//  DropboxAclUpdatePolicySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxAclUpdatePolicySerializer.h"

@implementation DropboxAclUpdatePolicySerializer

+ (NSString *)stringFromEnum:(DropboxAclUpdatePolicy)policy
{
    switch (policy) {
        case DAUPOwner:
            return @"owner";
        case DAUPEditors:
            return @"editors";
        default:
            return nil;
    }
}

@end
