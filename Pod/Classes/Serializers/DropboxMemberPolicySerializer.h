//
//  DropboxMemberPolicySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberPolicy.h"
#import "EnumToStringSerializer.h"

@interface DropboxMemberPolicySerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxMemberPolicy)policy;

@end
