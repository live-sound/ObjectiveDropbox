//
//  DropboxFileMetadata+DictionaryParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.03.16.
//  Copyright © 2016 Михаил Мотыженков. All rights reserved.
//

#import "DropboxFileMetadata+DictionaryParser.h"
#import "DropboxMediaInfo+DictionaryParser.h"
#import "DropboxFileSharingInfo+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFileMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.clientModified = [helper dateWithKey:@"client_modified"];
        self.serverModified = [helper dateWithKey:@"server_modified"];
        self.rev = [helper stringWithKey:@"rev"];
        self.size = [helper uint64WithKey:@"size"];
        self.id = [helper stringWithKey:@"id"];
        
        id mediaInfo = [helper dictionaryWithKey:@"media_info"];
        if (mediaInfo)
        {
            self.mediaInfo = [[DropboxMediaInfo alloc] initWithDictionary:mediaInfo];
        }
        
        id sharingInfo = [helper dictionaryWithKey:@"sharing_info"];
        if (sharingInfo)
        {
            self.sharingInfo = [[DropboxFileSharingInfo alloc] initWithDictionary:sharingInfo];
        }
    }
    return self;
}

@end
