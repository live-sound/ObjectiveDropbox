//
//  DropboxMemberPermission+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxMemberPermission+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxMemberActionParser.h"
#import "DropboxPermissionDeniedReasonParser.h"

@implementation DropboxMemberPermission (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        NSString *action = [helper stringWithKey:@"action"];
        if (action)
        {
            self.action = [DropboxMemberActionParser memberActionFromString:action];
        }
        
        self.allow = [helper boolWithKey:@"allow"];
        
        NSString *reason = [helper stringWithKey:@"reason"];
        if (reason)
        {
            self.reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:reason];
        }
    }
    return self;
}

@end
