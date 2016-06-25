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
    if (self) {
        _sharedFolderID = sharedFolderID;
        _toDropboxID = toDropboxID;
    }
    return self;
}

- (instancetype)init
{
    return [self initWithSharedFolderID:@"" toDropboxID:@""];
}

@end
