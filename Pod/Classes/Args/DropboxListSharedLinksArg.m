//
//  DropboxListSharedLinksArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListSharedLinksArg.h"

@implementation DropboxListSharedLinksArg

- (instancetype)initWithPath:(NSString *)path cursor:(NSString *)cursor directOnly:(BOOL)directOnly
{
    self = [super init];
    
    _path = path;
    _cursor = cursor;
    _directOnly = directOnly;
    
    return self;
}

- (instancetype)initWithPath:(NSString *)path cursor:(NSString *)cursor
{
    return [self initWithPath:path cursor:cursor directOnly:NO];
}

- (instancetype)initWithPath:(NSString *)path
{
    return [self initWithPath:path cursor:nil];
}

- (instancetype)initWithCursor:(NSString *)cursor
{
    return [self initWithPath:nil cursor:cursor];
}

- (instancetype)init
{
    return [self initWithPath:nil];
}

@end
