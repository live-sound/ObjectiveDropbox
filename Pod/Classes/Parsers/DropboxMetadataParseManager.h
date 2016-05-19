//
//  DropboxMetadataParseManager.h
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DropboxMetadata.h"
#import "DictionaryParseManager.h"

@interface DropboxMetadataParseManager : NSObject <DictionaryParseManager>

+ (id)parseDic:(NSDictionary *)dic;

@end
