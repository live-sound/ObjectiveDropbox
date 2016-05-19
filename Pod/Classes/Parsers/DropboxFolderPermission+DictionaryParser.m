//
//  DropboxFolderPermission+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxFolderPermission+DictionaryParser.h"
#import "DropboxFolderActionParser.h"
#import "DropboxPermissionDeniedReasonParser.h"
#import "DictionaryParseHelper.h"

@implementation DropboxFolderPermission (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];

    DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
    NSString *action = [helper stringWithKey:@"action"];
    if (action)
    {
        self.action = [DropboxFolderActionParser folderActionFromString:action];
    }
    
    self.allow = [helper boolWithKey:@"allow"];
    
    id reason = [helper stringWithKey:@"reason"];
    if (reason)
    {
        self.reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:reason];
    }
    
    return self;
}

@end
