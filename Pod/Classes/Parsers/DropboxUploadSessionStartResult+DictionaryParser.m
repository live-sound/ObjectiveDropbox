//
//  DropboxUploadSessionStartResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxUploadSessionStartResult+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxUploadSessionStartResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.sessionID = [helper stringWithKey:@"session_id"];
    }
    return self;
}

@end
