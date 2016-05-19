//
//  DropboxRelinquishFolderMembershipArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxRelinquishFolderMembershipArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID;

@end
