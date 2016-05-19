//
//  DropboxGetAccountArg+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxGetAccountArg+DictionarySerializer.h"

@implementation DropboxGetAccountArg (DictionarySerializer)

- (NSDictionary *)dictionaryFromParams
{
    return @{ @"account_id": self.accountID };
}

@end
