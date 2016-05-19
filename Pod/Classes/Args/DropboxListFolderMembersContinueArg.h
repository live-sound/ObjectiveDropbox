//
//  DropboxListFolderMembersContinueArg.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderMembersContinueArg : NSObject

/**
 *  The cursor returned by your last call to listFolderMembers or listFolderMembersContinue. 
 */
@property (nonatomic, nonnull) NSString *cursor;


- (nonnull instancetype)initWithCursor:(NSString * _Nonnull)cursor;

@end
