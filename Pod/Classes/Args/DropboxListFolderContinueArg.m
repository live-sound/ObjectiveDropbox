//
//  ListFolderContinueArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderContinueArg.h"

@implementation DropboxListFolderContinueArg

- (instancetype)initWithCursor:(NSString *)cursor
{
    self = [self init];
    if (self) {
        _cursor = cursor;
    }
    return self;
}

@end
