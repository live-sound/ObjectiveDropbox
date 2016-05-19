//
//  DropboxBaseSpaceAllocation.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxBaseSpaceAllocation : NSObject

/**
 *  The total space allocated to the user's account/team (bytes). 
 */
@property (nonatomic) UInt64 allocated;

@end
