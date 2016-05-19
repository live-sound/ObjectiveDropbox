//
//  DropboxSharedLinkPolicySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkPolicy.h"
#import "EnumToStringSerializer.h"

@interface DropboxSharedLinkPolicySerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nonnull)stringFromEnum:(DropboxSharedLinkPolicy)policy;

@end
