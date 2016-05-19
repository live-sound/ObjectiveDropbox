//
//  DropboxAddMember.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxMemberSelector.h"
#import "DropboxAccessLevel.h"

/**
 *  The member and type of access the member should have when added to a shared folder.
 */
@interface DropboxAddMember : NSObject

/**
 *  The member to add to the shared folder.
 */
@property (nonatomic, nonnull) DropboxMemberSelector *member;

/**
 *  The access level to grant member to the shared folder. AccessLevel.owner is disallowed. The default for this union is viewer.
 */
@property (nonatomic) DropboxAccessLevel accessLevel;


- (nonnull instancetype)initWithMember:(DropboxMemberSelector * _Nonnull)member accessLevel:(DropboxAccessLevel)accessLevel;

@end
