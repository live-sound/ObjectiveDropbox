//
//  DropboxTeamSpaceAllocation.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import "DropboxBaseSpaceAllocation.h"

@interface DropboxTeamSpaceAllocation : DropboxBaseSpaceAllocation

/**
 *  The total space currently used by the user's team (bytes).
 */
@property (nonatomic) UInt64 used;

@end
