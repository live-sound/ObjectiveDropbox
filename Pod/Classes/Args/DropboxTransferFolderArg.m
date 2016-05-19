//
//  DropboxTransferFolderArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxTransferFolderArg.h"

@implementation DropboxTransferFolderArg

- (instancetype)initWithSharedFolderID:(NSString *)sharedFolderID toDropboxID:(NSString *)toDropboxID
{
    self = [super init];
    _sharedFolderID = sharedFolderID;
    _toDropboxID = toDropboxID;
    return self;
}

- (instancetype)init
{
    self = [super init];
    _sharedFolderID = @"";
    _toDropboxID = @"";
    return self;
}

@end
