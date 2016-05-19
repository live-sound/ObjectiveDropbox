//
//  DropboxSharedLinkAccessFailureReasonParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 24.04.16.
//
//

#import "DropboxSharedLinkAccessFailureReasonParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxSharedLinkAccessFailureReasonParser

+ (DropboxSharedLinkAccessFailureReason)reasonFromDictionary:(NSDictionary *)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    id reason = [helper stringWithKey:@".tag"];
    if (reason)
    {
        return [self reasonFromString:reason];
    }
    return DSLAFRNotSet;
}

+ (DropboxSharedLinkAccessFailureReason)reasonFromString:(NSString *)string
{
    if ([string isEqualToString:@"login_required"])
    {
        return DSLAFRLoginRequired;
    }
    else if ([string isEqualToString:@"email_verify_required"])
    {
        return DSLAFREmailVerifyRequired;
    }
    else if ([string isEqualToString:@"password_required"])
    {
        return DSLAFRPasswordRequired;
    }
    else if ([string isEqualToString:@"team_only"])
    {
        return DSLAFRTeamOnly;
    }
    else if ([string isEqualToString:@"owner_only"])
    {
        return DSLAFROwnerOnly;
    }
    return DSLAFRNotSet;
}

@end
