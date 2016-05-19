//
//  DropboxSharedLinkMetadataParseManager.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxSharedLinkMetadataParseManager.h"
#import "DropboxFolderLinkMetadata+DictionaryParser.h"
#import "DropboxFileLinkMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedLinkMetadataParseManager

+ (DropboxSharedLinkMetadata *)metadataWithDictionary:(NSDictionary *)dic
{
    DropboxSharedLinkMetadata *result = nil;
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *tag = [helper stringWithKey:@".tag"];
    if (tag)
    {
        if ([tag isEqualToString:@"file"])
        {
            result = [[DropboxFileLinkMetadata alloc] initWithDictionary:dic];
        }
        else if ([tag isEqualToString:@"folder"])
        {
            result = [[DropboxFolderLinkMetadata alloc] initWithDictionary:dic];
        }
    }
    
    return result;
}

@end
