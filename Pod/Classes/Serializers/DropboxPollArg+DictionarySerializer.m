//
//  DropboxPollArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxPollArg+DictionarySerializer.h"

@implementation DropboxPollArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"async_job_id": self.asyncJobID };
}

@end
