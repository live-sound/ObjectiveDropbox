//
//  DropboxSharedLinkMetadataParseManager.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DropboxSharedLinkMetadata.h"

@interface DropboxSharedLinkMetadataParseManager : NSObject

+ (DropboxSharedLinkMetadata * _Nullable)metadataWithDictionary:(NSDictionary * _Nonnull)dic;

@end
