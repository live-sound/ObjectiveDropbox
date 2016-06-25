//
//  DropboxUploadSessionFinishArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxUploadSessionFinishArg.h"

@implementation DropboxUploadSessionFinishArg

- (instancetype)initWithCursor:(DropboxUploadSessionCursor *)cursor commit:(DropboxCommitInfo *)commit
{
    self = [super init];
    if (self) {
        _cursor = cursor;
        _commit = commit;
    }
    return self;
}

@end
