//
//  DropboxListFoldersContinueArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFoldersContinueArg : NSObject

/**
 *  The cursor returned by the previous API call specified in the endpoint description.
 */
@property (nonatomic, nonnull) NSString *cursor;


- (nonnull instancetype)initWithCursor:(NSString * _Nonnull)cursor;

@end
