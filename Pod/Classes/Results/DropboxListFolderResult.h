//
//  DropboxListFolderResult.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 29.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxMetadata.h"

@interface DropboxListFolderResult : NSObject

/**
 *  The files and (direct) subfolders in the folder.
 */
@property (nonatomic) NSArray<DropboxMetadata *> *entries;

/**
 *  Pass the cursor into filesListFolderContinue to see what's changed in the folder since your previous query.
 */
@property (nonatomic) NSString *cursor;

/**
 *  If true, then there are more entries available. Pass the cursor to filesListFolderContinue to retrieve the rest.
 */
@property (nonatomic) BOOL hasMore;

@end
