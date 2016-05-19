//
//  DropboxMemberActionParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberAction.h"

@interface DropboxMemberActionParser : NSObject

+ (DropboxMemberAction)memberActionFromString:(NSString * _Nonnull)string;

@end
