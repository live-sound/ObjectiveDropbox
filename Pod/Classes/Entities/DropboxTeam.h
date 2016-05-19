//
//  DropboxTeam.h
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import <Foundation/Foundation.h>

/**
 *  Information about a team. This datatype comes from an imported namespace originally defined in the users namespace.
 */
@interface DropboxTeam : NSObject

/**
 *  The team's unique ID.
 */
@property (nonatomic, nonnull) NSString *ID;

/**
 *  The name of the team.
 */
@property (nonatomic, nonnull) NSString *name;

@end
