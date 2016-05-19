//
//  ListFolderContinueArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderContinueArg : NSObject

/**
 *  The cursor returned by your last call to listFolder or listFolderContinue.
 */
@property (nonatomic, nonnull) NSString *cursor;

- (nonnull instancetype)initWithCursor:(NSString * _Nonnull)cursor;

@end
