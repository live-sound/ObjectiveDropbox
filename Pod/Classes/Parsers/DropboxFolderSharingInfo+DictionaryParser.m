//
//  DropboxFolderSharingInfo+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFolderSharingInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFolderSharingInfo (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.sharedFolderID = [helper stringWithKey:@"shared_folder_id"];
        
    return self;
}

@end
