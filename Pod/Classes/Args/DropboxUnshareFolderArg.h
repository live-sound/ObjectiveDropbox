//
//  DropboxUnshareFolderArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxUnshareFolderArg : NSObject

/**
 *  The ID for the shared folder.
 */
@property (nonatomic, nonnull) NSString *sharedFolderID;

/**
 *  If YES, members of this shared folder will get a copy of this folder after it's unshared. Otherwise, it will be removed from their Dropbox. The current user, who is an owner, will always retain their copy. The default for this field is NO.
 */
@property (nonatomic) BOOL leaveACopy;


- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID;
- (nonnull instancetype)initWithSharedFolderID:(NSString * _Nonnull)sharedFolderID leaveACopy:(BOOL)leaveACopy;

@end
