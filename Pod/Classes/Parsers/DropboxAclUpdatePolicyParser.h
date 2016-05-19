//
//  DropboxAclUpdatePolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxAclUpdatePolicy.h"

@interface DropboxAclUpdatePolicyParser : NSObject

+ (DropboxAclUpdatePolicy)aclUpdatePolicyFromDictionary:(NSDictionary * _Nonnull)dic;
+ (DropboxAclUpdatePolicy)aclUpdatePolicyFromString:(NSString * _Nonnull)string;


@end
