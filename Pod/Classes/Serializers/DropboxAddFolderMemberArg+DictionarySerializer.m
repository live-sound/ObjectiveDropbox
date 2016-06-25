//
//  DropboxAddFolderMemberArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "DropboxAddFolderMemberArg+DictionarySerializer.h"
#import "NSArray+ArrayOfDictionaries.h"

@implementation DropboxAddFolderMemberArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    result[@"shared_folder_id"] = self.sharedFolderID;
    result[@"members"] = [self.members arrayOfDictionaries];
    result[@"quiet"] = @(self.quiet);
    if (self.customMessage)
    {
        result[@"custom_message"] = self.customMessage;
    }
    return [result copy];
}

@end
