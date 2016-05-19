//
//  DropboxUploadSessionCursor.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionCursor.h"

@implementation DropboxUploadSessionCursor

- (instancetype)initWithSessionID:(NSString *)sessionID offset:(UInt64)offset
{
    self = [super init];
    _sessionID = sessionID;
    _offset = offset;
    return self;
}

@end
