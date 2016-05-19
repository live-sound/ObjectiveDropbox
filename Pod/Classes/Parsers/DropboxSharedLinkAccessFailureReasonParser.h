//
//  DropboxSharedLinkAccessFailureReasonParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkAccessFailureReason.h"

@interface DropboxSharedLinkAccessFailureReasonParser : NSObject

+ (DropboxSharedLinkAccessFailureReason)reasonFromString:(NSString * _Nonnull)string;
+ (DropboxSharedLinkAccessFailureReason)reasonFromDictionary:(NSDictionary * _Nonnull)dic;

@end
