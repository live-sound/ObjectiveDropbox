//
//  DropboxGetMetadataArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 05.04.16.
//
//

#import "DropboxGetMetadataArg.h"

@implementation DropboxGetMetadataArg

- (instancetype)initWithPath:(NSString *)path includeMediaInfo:(BOOL)includeMediaInfo includeDeleted:(BOOL)includeDeleted
{
    self = [self init];
    _path = path;
    _includeMediaInfo = includeMediaInfo;
    _includeDeleted = includeDeleted;
    return self;
}

@end
