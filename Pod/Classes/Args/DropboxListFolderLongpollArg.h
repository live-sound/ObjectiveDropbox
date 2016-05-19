//
//  DropboxListFolderLongpollArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderLongpollArg : NSObject

/**
 *  A cursor as returned by listFolder or listFolderContinue. Cursors retrieved by setting DropboxListFolderArg.includeMediaInfo to True are not supported.
 */
@property (nonatomic, nonnull) NSString *cursor;

/**
 *  A timeout in seconds. The request will block for at most this length of time, plus up to 90 seconds of random jitter added to avoid the thundering herd problem. Care should be taken when using this parameter, as some network infrastructure does not support long timeouts. The default for this field is 30.
 */
@property (nonatomic) UInt64 timeout;

- (nonnull instancetype)initWithCursor:(NSString * _Nonnull)cursor timeout:(UInt64)timeout;

@end
