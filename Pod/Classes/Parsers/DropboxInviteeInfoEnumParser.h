//
//  DropboxInviteeInfoParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxInviteeInfoEnum.h"

@interface DropboxInviteeInfoEnumParser : NSObject

+ (DropboxInviteeInfoEnum)inviteeInfoFromString:(NSString * _Nonnull)string;

@end
