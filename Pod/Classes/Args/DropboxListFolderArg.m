//
//  DropboxListFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderArg.h"

@implementation DropboxListFolderArg

- (instancetype)initWithPath:(NSString *)path recursive:(BOOL)recursive includeMediaInfo:(BOOL)includeMediaInfo includeDeleted:(BOOL)includeDeleted includeHasExplicitSharedMembers:(BOOL)includeHasExplicitSharedMembers
{
    self = [self init];
    _path = path;
    _recursive = recursive;
    _includeMediaInfo = includeMediaInfo;
    _includeDeleted = includeDeleted;
    _includeHasExplicitSharedMembers = includeHasExplicitSharedMembers;
    return self;
}

- (instancetype)initWithPath:(NSString *)path
{
    return [self initWithPath:path recursive:NO includeMediaInfo:NO includeDeleted:NO includeHasExplicitSharedMembers:NO];
}

@end
