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
    self = [super init];
    if (self) {
        _cursor = cursor;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithCursor:@""];
}

@end
