//
//  DropboxGetAccountBatchArg.m
//  Pods
//
//  Created by Михаил Мотыженков on 27.04.16.
//
//

#import "DropboxGetAccountBatchArg.h"

@implementation DropboxGetAccountBatchArg

- (instancetype)initWithAccountIDs:(NSString *)ID1, ...
{
    self = [self init];
    if (self) {
        NSMutableArray *IDs = [NSMutableArray new];
        va_list argumentList;
        [IDs addObject: ID1];
        va_start(argumentList, ID1);
        NSString *currentID;
        while ((currentID = va_arg(argumentList, NSString *)))
        {
            [IDs addObject:currentID];
        }
        va_end(argumentList);
        self.accountIDs = IDs;
    }    
    return self;
}

@end
