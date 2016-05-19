//
//  DropboxAclUpdatePolicyParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxAclUpdatePolicyParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxAclUpdatePolicyParser

+ (DropboxAclUpdatePolicy)aclUpdatePolicyFromDictionary:(NSDictionary * _Nonnull)dic
{
    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *result = [helper stringWithKey:@".tag"];
    if (result)
    {
        return [self aclUpdatePolicyFromString:result];
    }
    return DAUPNotSet;
}

+ (DropboxAclUpdatePolicy)aclUpdatePolicyFromString:(NSString * _Nonnull)string
{
    if ([string isEqualToString:@"owner"])
    {
        return DAUPOwner;
    }
    else if ([string isEqualToString:@"editors"])
    {
        return DAUPEditors;
    }
    return DAUPNotSet;
}

@end
