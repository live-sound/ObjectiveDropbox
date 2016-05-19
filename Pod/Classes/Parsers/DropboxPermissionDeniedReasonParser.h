//
//  DropboxPermissionDeniedReasonParser.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxPermissionDeniedReason.h"

@interface DropboxPermissionDeniedReasonParser : NSObject

+ (DropboxPermissionDeniedReason)permissionDeniedReasonFromString:(NSString * _Nonnull)string;

@end
