//
//  DropboxFileSystemSharingInfo+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFileSystemSharingInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFileSystemSharingInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.readOnly = [helper boolWithKey:@"read_only"];
        self.parentSharedFolderID = [helper stringWithKey:@"parent_shared_folder_id"];
    }
    return self;
}

@end
