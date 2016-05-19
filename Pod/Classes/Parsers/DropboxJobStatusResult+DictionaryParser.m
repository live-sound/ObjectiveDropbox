//
//  DropboxJobStatusResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxJobStatusResult+DictionaryParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxJobStatusResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id status = [helper stringWithKey:@".tag"];
    if (status)
    {
        self.status = [self jobStatusFromString:status];
    }
    if (self.status == failed)
    {
        self.errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    }
    return self;
}

- (DropboxJobStatusEnum)jobStatusFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"in_progress"])
        return inProgress;
    else if ([string isEqualToString:@"complete"])
        return complete;
    else if ([string isEqualToString:@"failed"])
        return failed;
    else
        return jobStatusUnknown;
}

+ (NSString * _Nullable)errorSummaryFromDictionary:(NSDictionary * _Nonnull)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id failed = [helper stringWithKey:@"failed"];
    if (failed)
    {
        NSString *failedString = failed;
        if ([failedString isEqualToString:@"unshare_folder_error"])
        {
            NSString *failedString2 = [helper stringWithKey:failedString];
            if (failedString2)
            {
                if ([failedString2 isEqualToString:@"access_error"])
                {
                    NSString *failedString3 = [helper stringWithKey:failedString2];
                    if (failedString3)
                    {
                        return [NSString stringWithFormat:@"%@/%@/%@", failedString, failedString2, failedString3];
                    }
                }
                return [NSString stringWithFormat:@"%@/%@", failedString, failedString2];
            }
        }
        else if ([failedString isEqualToString:@"remove_folder_member_error"])
        {
            NSString *failedString2 = [helper stringWithKey:failedString];
            if (failedString2)
            {
                if ([failedString2 isEqualToString:@"access_error"] || [failedString2 isEqualToString:@"member_error"])
                {
                    NSString *failedString3 = [helper stringWithKey:failedString2];
                    if (failedString3)
                    {
                        return [NSString stringWithFormat:@"%@/%@/%@", failedString, failedString2, failedString3];
                    }
                }
                return [NSString stringWithFormat:@"%@/%@", failedString, failedString2];
            }
        }
        return failedString;
    }
    return nil;
}

@end
