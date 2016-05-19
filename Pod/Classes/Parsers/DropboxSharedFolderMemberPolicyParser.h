//
//  DropboxSharedFolderMemberPolicyParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedFolderMemberPolicy.h"

@interface DropboxSharedFolderMemberPolicyParser : NSObject

+ (DropboxSharedFolderMemberPolicy)sharedFolderMemberPolicyFromString:(NSString * _Nonnull)string;
+ (DropboxSharedFolderMemberPolicy)sharedFolderMemberPolicyFromDictionary:(NSDictionary * _Nonnull)dic;

@end
