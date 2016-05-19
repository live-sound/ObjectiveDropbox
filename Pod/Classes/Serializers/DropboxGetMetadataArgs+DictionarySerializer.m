//
//  DropboxGetMetadataArgs+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "DropboxGetMetadataArgs+DictionarySerializer.h"
#import "DropboxFolderActionSerializer.h"
#import "NSArray+ArrayOfStrings.h"

@implementation DropboxGetMetadataArgs (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSArray *actions = @[];
    if (self.actions)
    {
        actions = [self.actions arrayOfStringsWithSerializer:[DropboxFolderActionSerializer class]];
    }
    
    return @{ @"shared_folder_id": self.sharedFolderID,
              @"actions": actions };
}



@end
