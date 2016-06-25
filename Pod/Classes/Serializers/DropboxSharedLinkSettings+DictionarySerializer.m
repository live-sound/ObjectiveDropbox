//
//  DropboxSharedLinkSettings+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxSharedLinkSettings+DictionarySerializer.h"
#import "NSDate+DateToDropboxString.h"
#import "DropboxRequestedVisibilityStringSerializer.h"

@implementation DropboxSharedLinkSettings (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    if (self.requestedVisibility != DRVNotSet)
    {
        result[@"requested_visibility"] = [DropboxRequestedVisibilityStringSerializer stringFromEnum:self.requestedVisibility];
    }
    if (self.linkPassword)
    {
        result[@"link_password"] = self.linkPassword;
    }
    if (self.expires)
    {
        result[@"expires"] = [self.expires dropboxDate];
    }
    return [result copy];
}

@end
