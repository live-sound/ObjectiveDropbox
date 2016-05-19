//
//  DropboxMountFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxMountFolderArg : NSObject

/**
 *  The ID of the shared folder to mount.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID;

@end
