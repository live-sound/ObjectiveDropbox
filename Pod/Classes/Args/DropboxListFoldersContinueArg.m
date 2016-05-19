//
//  DropboxListFoldersContinueArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFoldersContinueArg.h"

@implementation DropboxListFoldersContinueArg

- (instancetype)initWithCursor:(NSString *)cursor
{
    self = [self init];
    _cursor = cursor;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _cursor = @"";
    return self;
}

@end
