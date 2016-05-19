//
//  DropboxListFoldersArgs+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DropboxListFoldersArgs+DictionarySerializer.h"
#import "NSArray+ArrayOfStrings.h"
#import "DropboxFolderActionSerializer.h"

@implementation DropboxListFoldersArgs (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    NSMutableDictionary *result = [NSMutableDictionary new];
    
    result[@"limit"] = @(self.limit);
    if (self.actions)
    {
        result[@"actions"] = [self.actions arrayOfStringsWithSerializer:[DropboxFolderActionSerializer class]];
    }
    
    return result;
}

@end
