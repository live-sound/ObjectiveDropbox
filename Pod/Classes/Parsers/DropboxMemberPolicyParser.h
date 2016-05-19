//
//  DropboxMemberPolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberPolicy.h"

@interface DropboxMemberPolicyParser : NSObject

+ (DropboxMemberPolicy)memberPolicyFromDictionary:(NSDictionary * _Nonnull)dic;
+ (DropboxMemberPolicy)memberPolicyFromString:(NSString * _Nonnull)string;

@end
