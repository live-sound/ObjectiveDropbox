//
//  DropboxGetAccountBatchArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxGetAccountBatchArg+DictionarySerializer.h"
#import "NSArray+ArrayOfStrings.h"

@implementation DropboxGetAccountBatchArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"account_ids": self.accountIDs };
}

@end
