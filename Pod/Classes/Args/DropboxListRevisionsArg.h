//
//  DropboxListRevisionsArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListRevisionsArg : NSObject

/**
 *  The path to the file you want to see the revisions of.
 */
@property (nonatomic, nonnull) NSString *path;

/**
 *  The maximum number of revision entries returned. The default for this field is 10.
 */
@property (nonatomic) UInt64 limit;

- (nonnull instancetype)initWithPath:(NSString * _Nonnull)path limit:(UInt64)limit;

@end
