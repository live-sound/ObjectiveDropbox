//
//  DropboxListFolderMembersArgs+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxListFolderMembersArgs+DictionarySerializer.h"
#import "NSArray+ArrayOfStrings.h"
#import "DropboxMemberActionSerializer.h"

@implementation DropboxListFolderMembersArgs (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSArray *actions = @[];
    if (self.actions)
    {
        actions = [self.actions arrayOfStringsWithSerializer:[DropboxMemberActionSerializer class]];
    }
    return @{@"shared_folder_id": self.sharedFolderID,
             @"actions": actions,
             @"limit": @(self.limit) };
}

@end
