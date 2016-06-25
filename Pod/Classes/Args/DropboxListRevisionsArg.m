//
//  DropboxListRevisionsArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListRevisionsArg.h"

@implementation DropboxListRevisionsArg

- (instancetype)initWithPath:(NSString *)path limit:(UInt64)limit
{
    self = [self init];
    if (self) {
        _path = path;
        _limit = limit;
    }
    return self;
}

@end
