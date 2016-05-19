//
//  DropboxAclUpdatePolicySerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAclUpdatePolicy.h"
#import "EnumToStringSerializer.h"

@interface DropboxAclUpdatePolicySerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxAclUpdatePolicy)policy;

@end
