//
//  DropboxShareFolderLaunchEnumParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxShareFolderLaunchEnumParser.h"

@implementation DropboxShareFolderLaunchEnumParser

+ (DropboxShareFolderLaunchEnum)enumFromString:(NSString *)string
{
    if ([string isEqualToString:@"async_job_id"])
    {
        return DSFLAsyncJobID;
    }
    else if ([string isEqualToString:@"complete"])
    {
        return DSFLComplete;
    }
    return DSFLNotSet;
}

@end
