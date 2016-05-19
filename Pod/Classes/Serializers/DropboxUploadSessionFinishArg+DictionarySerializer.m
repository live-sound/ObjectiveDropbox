//
//  DropboxUploadSessionFinishArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionFinishArg+DictionarySerializer.h"
#import "DropboxUploadSessionCursor+DictionarySerializer.h"
#import "DropboxCommitInfo+DictionarySerializer.h"

@implementation DropboxUploadSessionFinishArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{@"cursor": [self.cursor dictionaryFromParams],
             @"commit": [self.commit dictionaryFromParams]};
}

@end
