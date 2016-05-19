//
//  NSArray+DictionarySerializer.m
//  Pods
//
//  Created by Михаил Мотыженков on 22.04.16.
//
//

#import "NSArray+ArrayOfDictionaries.h"

@implementation NSArray (ArrayOfDictionaries)

- (NSArray * _Nonnull)arrayOfDictionaries
{
    NSMutableArray *result = [NSMutableArray new];
    for (id member in self)
    {
        if (![[member class] conformsToProtocol:@protocol(DictionarySerializer)])
        {
            return self;
        }
        id<DictionarySerializer> goodMember = member;
        NSDictionary *dic = [goodMember dictionaryFromParams];
        [result addObject:dic];
    }
    return result;
}

@end
