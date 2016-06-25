//
//  DropboxGetMetadataArgs.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxGetMetadataArgs.h"

@implementation DropboxGetMetadataArgs

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID actions:(DropboxFolderAction)action1, ...
{
    self = [self initWithSharedFolderID:sharedFolderID];
    if (self) {
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

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID
{
    self = [self init];
    if (self) {
        _sharedFolderID = sharedFolderID;
    }
    return self;
}

@end
