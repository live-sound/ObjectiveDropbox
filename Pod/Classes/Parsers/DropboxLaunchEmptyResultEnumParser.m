//
//  DropboxLaunchEmptyResultEnumParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxLaunchEmptyResultEnumParser.h"

@implementation DropboxLaunchEmptyResultEnumParser

+ (DropboxLaunchEmptyResultEnum)launchEmptyResultFromString:(NSString *)string
{
    if ([string isEqualToString:@"async_job_id"])
    {
        return DLERAsyncJobID;
    }
    else if ([string isEqualToString:@"complete"])
    {
        return DLERComplete;
    }
    return DLERNotSet;
}

@end
