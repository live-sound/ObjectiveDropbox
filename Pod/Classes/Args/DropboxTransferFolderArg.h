//
//  DropboxTransferFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxTransferFolderArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  A account or team member ID to transfer ownership to.
 */
@property (nonatomic, nonnull) NSString *toDropboxID;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID toDropboxID:(NSString * _Nonnull)toDropboxID;

@end
