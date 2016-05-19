//
//  DropboxListFolderLongpollResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderLongpollResult : NSObject

/**
 *  Indicates whether new changes are available. If true, call listFolder to retrieve the changes.
 */
@property (nonatomic) BOOL changes;

/**
 *  UInt64. If present, backoff for at least this many seconds before calling listFolder/longpoll again. This field is optional.
 */
@property (nonatomic, nullable) NSNumber *backoff;

@end
