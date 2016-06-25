
//
//  DropboxSearchArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchArg.h"

@implementation DropboxSearchArg

- (instancetype)initWithPath:(NSString *)path query:(NSString *)query start:(UInt64)start maxResults:(UInt64)maxResults mode:(DropboxSearchMode)mode
{
    self = [self init];
    if (self) {
        _path = path;
        _query = query;
        _start = start;
        _maxResults = maxResults;
        _mode = mode;
    }
    return self;
}

- (instancetype)initWithPath:(NSString *)path query:(NSString *)query
{
    return [self initWithPath:path query:query start:0 maxResults:100 mode:fileName];
}

@end
