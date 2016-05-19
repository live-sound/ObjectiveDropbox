//
//  DropboxRestoreArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 20.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxRestoreArg : NSObject

/**
 *  The path to the file you want to restore.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  The revision to restore for the file.
 */
@property (nonatomic, nonnull) NSString *rev;

/**
 *  Recommended initializer
 *
 *  @param path The path to the file you want to restore.
 *  @param rev  The revision to restore for the file.
 *
 *  @return DropboxRestoreArg
 */
- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path rev:(NSString * _Nonnull)rev;

@end
