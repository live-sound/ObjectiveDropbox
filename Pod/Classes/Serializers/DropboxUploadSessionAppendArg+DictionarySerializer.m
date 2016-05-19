//
//  DropboxUploadSessionAppendArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionAppendArg+DictionarySerializer.h"
#import "DropboxUploadSessionCursor+DictionarySerializer.h"

@implementation DropboxUploadSessionAppendArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSDictionary *cursorDic = [self.cursor dictionaryFromParams];
    return @{@"cursor": cursorDic,
             @"close": @(self.close)};
}

@end
