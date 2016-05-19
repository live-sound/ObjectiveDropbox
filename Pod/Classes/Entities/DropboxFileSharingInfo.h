//
//  DropboxFileSharingInfo.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 16.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxFileSystemSharingInfo.h"

@interface DropboxFileSharingInfo : DropboxFileSystemSharingInfo


/**
 *  The last user who modified the file. This field will be null if the user's account has been deleted. This field is optional. 
 */
@property (nonatomic, nullable) NSString *modifiedBy;

@end
