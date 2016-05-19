//
//  DropboxUploadSessionStartResult.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxUploadSessionStartResult.h"

@implementation DropboxUploadSessionStartResult

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ sessionID: %@ }", self.sessionID];
}

@end
