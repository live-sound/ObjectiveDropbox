//
//  DropboxDeleteArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxDeleteArg : NSObject

/**
 *  Path in the user's Dropbox to delete. Example: "/Homework/math/Prime_Numbers.txt"
 */
@property (nonatomic, nonnull) NSString *path;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path;

@end
