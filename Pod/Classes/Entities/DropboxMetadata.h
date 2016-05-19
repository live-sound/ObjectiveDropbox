//
//  DropboxMetadata.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 15.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DropboxMetadata : NSObject

/**
 *  The last component of the path (including extension). This never contains a slash.
 */
@property (nonatomic, nonnull) NSString *name;

/**
 *  The lowercased full path in the user's Dropbox. This always starts with a slash.
 */
@property (nonatomic, nonnull) NSString *pathLower;

/**
 *  The cased path to be used for display purposes only. In rare instances the casing will not correctly match the user's filesystem, but this behavior will match the path provided in the Core API v1. Changes to the casing of paths won't be returned by listFolderContinue
 */
@property (nonatomic, nonnull) NSString *pathDisplay;


@end
