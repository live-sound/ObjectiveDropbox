//
//  DropboxSharedLinkPolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkPolicy.h"

@interface DropboxSharedLinkPolicyParser : NSObject

+ (DropboxSharedLinkPolicy)sharedLinkPolicyFromDictionary:(NSDictionary * _Nonnull)dic;
+ (DropboxSharedLinkPolicy)sharedLinkPolicyFromString:(NSString * _Nonnull)string;

@end
