//
//  DropboxUploadSessionAppendArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionAppendArg.h"

@implementation DropboxUploadSessionAppendArg

- (instancetype)initWithCursor:(DropboxUploadSessionCursor *)cursor close:(BOOL)close
{
    self = [super init];
    if (self) {
        _cursor = cursor;
        _close = close;
    }
    return self;
}

@end
