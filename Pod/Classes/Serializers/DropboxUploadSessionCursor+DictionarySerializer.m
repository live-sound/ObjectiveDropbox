//
//  DropboxUploadSessionCursor+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionCursor+DictionarySerializer.h"

@implementation DropboxUploadSessionCursor (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"session_id": self.sessionID,
             @"offset": @(self.offset)};
}

@end
