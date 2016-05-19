//
//  DropboxSpaceAllocation.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSpaceAllocationEnum.h"
#import "DropboxIndividualSpaceAllocation.h"
#import "DropboxTeamSpaceAllocation.h"

/**
 *  Space is allocated differently based on the type of account.
 */
@interface DropboxSpaceAllocation : NSObject

@property (nonatomic) DropboxSpaceAllocationEnum type;

/**
 *  value for type == DSAIndividual
 */
@property (nonatomic, nonnull) DropboxIndividualSpaceAllocation *valueIndividual;

/**
 *  value for type == DSATeam
 */
@property (nonatomic, nonnull) DropboxTeamSpaceAllocation *valueTeam;

@end
