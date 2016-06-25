//
//  DropboxListFoldersArgs.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFoldersArgs.h"

@implementation DropboxListFoldersArgs

- (instancetype)initWithLimit:(UInt32)limit actions:(DropboxFolderAction)action1, ...
{
    self = [super init];
    if (self) {
        _limit = limit;
        
        NSMutableArray *actions = [NSMutableArray new];
        va_list argumentList;
        [actions addObject: @(action1)];
        va_start(argumentList, action1);
        DropboxFolderAction currentAction;
        while ((currentAction = va_arg(argumentList, DropboxFolderAction)))
        {
            [actions addObject: @(currentAction)];
        }
        va_end(argumentList);
        self.actions = actions;
    }
    return self;
}

- (instancetype)initWithLimit:(UInt32)limit
{
    self = [super init];
    if (self) {
        _limit = limit;
        _actions = @[];
    }
    return self;
}

- (instancetype)init
{
    return [self initWithLimit:1000];
}

@end
