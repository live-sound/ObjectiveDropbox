//
//  DropboxFolderMetadata+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFolderMetadata+DictionaryParser.h"
#import "DropboxFolderSharingInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFolderMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.id = [helper stringWithKey:@"id"];
    
    id folder_sharing_info = [helper dictionaryWithKey:@"sharing_info"];
    if (folder_sharing_info)
    {
        self.sharingInfo = [[DropboxFolderSharingInfo alloc] initWithDictionary:folder_sharing_info];
    }
    
    return self;
}

@end
