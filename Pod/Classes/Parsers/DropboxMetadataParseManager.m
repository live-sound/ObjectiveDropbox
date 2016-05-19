//
//  DropboxMetadataParseManager.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxMetadataParseManager.h"
#import "DropboxFileMetadata+DictionaryParser.h"
#import "DropboxFolderMetadata+DictionaryParser.h"
#import "DropboxDeletedMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxMetadataParseManager

+ (id)parseDic:(NSDictionary *)dic
{
    DropboxMetadata *result;
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        if ([tag isEqualToString:@"file"])
        {
            result = [[DropboxFileMetadata alloc] initWithDictionary:dic];
        }
        else if ([tag isEqualToString:@"folder"])
        {
            result = [[DropboxFolderMetadata alloc] initWithDictionary:dic];
        }
        else
        {
            result = [[DropboxDeletedMetadata alloc] initWithDictionary:dic];
        }
    }
    else
    {
        result = [[DropboxDeletedMetadata alloc] initWithDictionary:dic];
    }
    return result;
}

@end
