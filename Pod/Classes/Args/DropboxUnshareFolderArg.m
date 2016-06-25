//
//  DropboxUnshareFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxUnshareFolderArg.h"

@implementation DropboxUnshareFolderArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID leaveACopy:(BOOL)leaveACopy
{
    self = [super init];
    if (self) {
        _sharedFolderID = sharedFolderID;
        _leaveACopy = leaveACopy;
    }
    return self;
}

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID
{
    return [self initWithSharedFolderID:sharedFolderID leaveACopy:NO];
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@""];
}

@end
