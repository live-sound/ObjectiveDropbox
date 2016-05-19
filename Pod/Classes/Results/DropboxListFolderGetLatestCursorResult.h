//
//  DropboxListFolderGetLatestCursorResult.h
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import <Foundation/Foundation.h>

@interface DropboxListFolderGetLatestCursorResult : NSObject

/**
 *  Pass the cursor into listFolderContinue to see what's changed in the folder since your previous query.
 */
@property (nonatomic, nonnull) NSString *cursor;

@end
