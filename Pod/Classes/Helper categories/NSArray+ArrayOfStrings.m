//
//  NSArray+ArrayOfStrings.m
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import "NSArray+ArrayOfStrings.h"

@implementation NSArray (ArrayOfStrings)

- (NSArray<NSString *> * _Nonnull)arrayOfStringsWithSerializer:(Class<EnumToStringSerializer> _Nonnull)serializerType
{
    NSMutableArray *result = [NSMutableArray new];
    
    for (NSNumber *number in self)
    {
        NSUInteger value = number.unsignedIntegerValue;
        NSString *string = [serializerType stringFromEnum:value];
        [result addObject:string];
    }
    
    return [result copy];
}

@end
