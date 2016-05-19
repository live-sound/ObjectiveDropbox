//
//  DropboxRemoveFolderMemberArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxRemoveFolderMemberArg.h"

@implementation DropboxRemoveFolderMemberArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID member:(DropboxMemberSelector *)member leaveACopy:(BOOL)leaveACopy
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    _member = member;
    _leaveACopy = leaveACopy;
    return self;
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@"" member:[DropboxMemberSelector new] leaveACopy:NO];
}

@end
