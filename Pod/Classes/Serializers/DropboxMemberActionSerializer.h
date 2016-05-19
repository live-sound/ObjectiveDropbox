//
//  DropboxMemberActionSerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberAction.h"
#import "EnumToStringSerializer.h"

@interface DropboxMemberActionSerializer : NSObject <EnumToStringSerializer>

+ (NSString * _Nullable)stringFromEnum:(DropboxMemberAction)action;

@end
