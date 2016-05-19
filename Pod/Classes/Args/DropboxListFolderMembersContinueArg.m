//
//  DropboxListFolderMembersContinueArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFolderMembersContinueArg.h"

@implementation DropboxListFolderMembersContinueArg

- (instancetype)initWithCursor:(NSString *)cursor
{
    self = [self init];
    _cursor = cursor;
    return self;
}

@end
