//
//  DropboxSharedFolderJoinPolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderJoinPolicy.h"

@interface DropboxSharedFolderJoinPolicyParser : NSObject

+ (DropboxSharedFolderJoinPolicy)sharedFolderJoinPolicyFromString:(NSString * _Nonnull)string;
+ (DropboxSharedFolderJoinPolicy)sharedFolderJoinPolicyFromDictionary:(NSDictionary * _Nonnull)dic;

@end
