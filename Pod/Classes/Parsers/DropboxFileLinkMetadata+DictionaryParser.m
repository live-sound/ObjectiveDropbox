//
//  DropboxFileLinkMetadata+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxFileLinkMetadata+DictionaryParser.h"
#import "DropboxSharedLinkMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFileLinkMetadata (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super initWithDictionary:dic];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    self.clientModified = [helper dateWithKey:@"client_modified"];
    self.serverModified = [helper dateWithKey:@"server_modified"];
    self.rev = [helper stringWithKey:@"rev"];
    self.size = [helper uint64WithKey:@"size"];
    
    return self;
}

@end
