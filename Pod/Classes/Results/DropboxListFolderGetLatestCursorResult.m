//
//  DropboxListFolderGetLatestCursorResult.m
//  Pods
//
//  Created by Михаил Мотыженков on 06.04.16.
//
//

#import "DropboxListFolderGetLatestCursorResult.h"

@implementation DropboxListFolderGetLatestCursorResult

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ sessionID: %@ }", self.cursor];
}


@end
