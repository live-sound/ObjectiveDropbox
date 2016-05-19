//
//  DropboxAddFolderMemberArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAddFolderMemberArg.h"

@implementation DropboxAddFolderMemberArg

- (instancetype)init
{
    self = [super init];
    _sharedFolderID = @"";
    _members = [NSArray new];
    return self;
}

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID members:(NSArray<DropboxAddMember *> *)members quiet:(BOOL)quiet customMessage:(NSString *)customMessage
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    _members = members;
    _quiet = quiet;
    _customMessage = customMessage;
    return self;
}

@end
