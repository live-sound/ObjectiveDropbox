//
//  DropboxShareFolderJobStatusResult+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxShareFolderJobStatusResult+DictionaryParser.h"
#import "DropboxSharedFolderMetadata+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxDefines.h"

@implementation DropboxShareFolderJobStatusResult (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        id status = [helper stringWithKey:@".tag"];    
        if (status)
        {
            self.status = [self statusFromString:status];
        }
        
        if (self.status == DSFJSComplete)
        {
            self.metadata = [[DropboxSharedFolderMetadata alloc] initWithDictionary:dic];
        }
        else if (self.status == DSFJSFailed)
        {
            self.errorSummary = [self errorSummaryFromDictionary:dic];
        }
    }
    return self;
}

- (DropboxShareFolderJobStatus)statusFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"in_progress"])
    {
        return DSFJSInProgress;
    }
    else if ([string isEqualToString:@"complete"])
    {
        return DSFJSComplete;
    }
    else if ([string isEqualToString:@"failed"])
    {
        return DSFJSFailed;
    }
    return DSFJSNotSet;
}

- (NSString * _Nonnull)errorSummaryFromDictionary:(NSDictionary * _Nonnull)dic
{
    id value = dic[@"failed"];
    if (NotNull(value))
    {
        if ([value isKindOfClass:[NSString class]])
        {
            return value;
        }
    }
    return @"Unknown error";
}

@end
