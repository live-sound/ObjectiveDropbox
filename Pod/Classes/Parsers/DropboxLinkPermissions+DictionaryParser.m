//
//  DropboxLinkPermissions+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxLinkPermissions+DictionaryParser.h"
#import "DropboxResolvedVisibilityParser.h"
#import "DropboxRequestedVisibilityParser.h"
#import "DropboxSharedLinkAccessFailureReasonParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxDefines.h"

@implementation DropboxLinkPermissions (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.canRevoke = [helper boolWithKey:@"can_revoke"];
        
        id resolvedVisibility = dic[@"resolved_visibility"];
        if (NotNull(resolvedVisibility))
        {
            if ([resolvedVisibility isKindOfClass:[NSDictionary class]])
            {
                self.resolvedVisibility = [DropboxResolvedVisibilityParser resolvedVisibilityFromDictionary:resolvedVisibility];
            }
            else if ([resolvedVisibility isKindOfClass:[NSString class]])
            {
                self.resolvedVisibility = [DropboxResolvedVisibilityParser resolvedVisibilityFromString:resolvedVisibility];
            }
        }
        
        id requestedVisibility = dic[@"requested_visibility"];
        if (NotNull(requestedVisibility))
        {
            if ([requestedVisibility isKindOfClass:[NSDictionary class]])
            {
                self.requestedVisibility = [DropboxRequestedVisibilityParser requestedVisibilityFromDictionary:requestedVisibility];
            }
            else if ([requestedVisibility isKindOfClass:[NSString class]])
            {
                self.requestedVisibility = [DropboxRequestedVisibilityParser requestedVisibilityFromString:requestedVisibility];
            }
        }
        
        id revokeFailureReason = dic[@"revoke_failure_reason"];
        if (NotNull(revokeFailureReason))
        {
            if ([revokeFailureReason isKindOfClass:[NSDictionary class]])
            {
                self.revokeFailureReason = [DropboxSharedLinkAccessFailureReasonParser reasonFromDictionary:revokeFailureReason];
            }
            else if ([revokeFailureReason isKindOfClass:[NSString class]])
            {
                self.revokeFailureReason = [DropboxSharedLinkAccessFailureReasonParser reasonFromString:revokeFailureReason];
            }
        }
    }
    return self;
}

@end
