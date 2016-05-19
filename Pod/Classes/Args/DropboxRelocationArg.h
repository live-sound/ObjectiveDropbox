//
//  DropboxRelocationArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxRelocationArg : NSObject

/**
 *  Path in the user's Dropbox to be copied or moved.
 */
@property (nonatomic, nonnull) NSString *fromPath;

/**
 *  Path in the user's Dropbox that is the destination. 
 */
@property (nonatomic, nonnull) NSString *toPath;

- (nonnull instancetype)initWithFromPath:(NSString * _Nonnull)fromPath toPath:(NSString * _Nonnull)toPath;

@end
