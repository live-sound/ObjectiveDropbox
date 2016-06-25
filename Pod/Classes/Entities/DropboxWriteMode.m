//
//  DropboxWriteMode.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxWriteMode.h"

@implementation DropboxWriteMode

- (instancetype)initWithMode:(DropboxWriteModeEnum)mode updateString:(NSString *)updateString
{
    self = [super init];
    if (self) {
        _mode = mode;
        _updateString = updateString;
    }
    return self;
}

- (instancetype)initWithOverwrite
{
    return [self initWithMode:DWMOverwrite updateString:nil];
}

- (instancetype)initWithAdd
{
    return [self initWithMode:DWMAdd updateString:nil];
}

- (instancetype)initWithUpdate:(NSString * _Nonnull)updateString
{
    return [self initWithMode:DWMUpdate updateString:updateString];
}

- (instancetype)init
{
    return [self initWithMode:DWMNotSet updateString:nil];    
}

@end
