
//
//  DropboxSpaceAllocationEnum.h
//  Pods
//
//  Created by Михаил Мотыженков on 28.04.16.
//
//

typedef enum : NSUInteger {
    
    /**
     *  The user's space allocation applies only to their individual account.
     */
    DSAIndividual,
    
    /**
     *  The user shares space with other members of their team.
     */
    DSATeam,
    DSANotSet
} DropboxSpaceAllocationEnum;