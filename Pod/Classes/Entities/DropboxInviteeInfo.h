//
//  DropboxInviteeInfo.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxInviteeInfoEnum.h"

/**
 *  Information about the recipient of a shared folder invitation.
 */
@interface DropboxInviteeInfo : NSObject

@property (nonatomic, nullable) NSString *value;

@property (nonatomic) DropboxInviteeInfoEnum type;

@end
