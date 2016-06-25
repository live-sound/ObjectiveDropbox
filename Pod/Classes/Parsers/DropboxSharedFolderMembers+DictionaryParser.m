//
//  DropboxSharedFolderMembers+DictionaryParser.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxSharedFolderMembers+DictionaryParser.h"
#import "DictionaryParseHelper.h"
#import "DropboxUserMembershipInfo+DictionaryParser.h"
#import "DropboxGroupMembershipInfo+DictionaryParser.h"
#import "DropboxInviteeMembershipInfo+DictionaryParser.h"

@implementation DropboxSharedFolderMembers (DictionaryParser)

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        DictionaryParseHelper *helper = [[DictionaryParseHelper alloc] initWithDictionary:dic];
        self.users = [helper arrayWithKey:@"users" type:[DropboxUserMembershipInfo class]];
        self.groups = [helper arrayWithKey:@"groups" type:[DropboxGroupMembershipInfo class]];
        self.invitees = [helper arrayWithKey:@"invitees" type:[DropboxInviteeMembershipInfo class]];
        self.cursor = [helper stringWithKey:@"cursor"];
    }
    return self;
}

@end
