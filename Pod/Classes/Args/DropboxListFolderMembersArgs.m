//
//  DropboxLinkFolderMembersArgs.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxListFolderMembersArgs.h"

@implementation DropboxListFolderMembersArgs

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID limit:(UInt32)limit
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    _limit = limit;
    return self;
}

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID limit:(UInt32)limit actions:(DropboxMemberAction)action1, ...
{
    self = [self initWithSharedFolderID:sharedFolderID limit:limit];
    
    NSMutableArray *actions = [NSMutableArray new];
    va_list argumentList;
    [actions addObject: @(action1)];
    va_start(argumentList, action1);
    DropboxMemberAction currentAction;
    while ((currentAction = va_arg(argumentList, DropboxMemberAction)))
    {
        [actions addObject: @(currentAction)];
    }
    va_end(argumentList);
    self.actions = actions;
    
    return self;
}

@end
