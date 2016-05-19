//
//  DropboxSharedLinkCreatePolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkCreatePolicy.h"

@interface DropboxSharedLinkCreatePolicyParser : NSObject

+ (DropboxSharedLinkCreatePolicy)sharedLinkCreatePolicyFromString:(NSString * _Nonnull)string;
+ (DropboxSharedLinkCreatePolicy)sharedLinkCreatePolicyFromDictionary:(NSDictionary * _Nonnull)dic;

@end
