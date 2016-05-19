//
//  DropboxSpaceUsage.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSpaceAllocation.h"

/**
 *  Information about a user's space usage and quota.
 */
@interface DropboxSpaceUsage : NSObject

/**
 *  The user's total space usage (bytes).
 */
@property (nonatomic) UInt64 used;

/**
 *  The user's space allocation.
 */
@property (nonatomic, nonnull) DropboxSpaceAllocation *allocation;

@end
