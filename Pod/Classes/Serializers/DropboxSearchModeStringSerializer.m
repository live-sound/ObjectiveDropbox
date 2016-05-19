//
//  DropboxSearchModeDictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "DropboxSearchModeStringSerializer.h"

@implementation DropboxSearchModeStringSerializer

+ (NSString *)stringFromEnum:(DropboxSearchMode)searchMode
{
    switch (searchMode) {
        case fileName:
            return @"filename";
        case fileNameAndContent:
            return @"filename_and_content";
        case deletedFileName:
            return @"deleted_filename";
        default:
            return nil;
    }
}

@end
