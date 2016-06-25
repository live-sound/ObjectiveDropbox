//
//  DictionaryParseHelper.m
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import "DictionaryParseHelper.h"
#import "DropboxDefines.h"
#import "NSString+DropboxStringToDate.h"

@interface DictionaryParseHelper ()

@property (nonatomic) NSDictionary *dic;

@end


@implementation DictionaryParseHelper

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [self init];
    if (self) {
        _dic = dic;
    }
    return self;
}

- (NSDictionary * _Nullable)dictionaryWithKey:(NSString *)key
{
    id value = self.dic[key];
    if (NotNull(value) && [value isKindOfClass:[NSDictionary class]])
    {
        return [value copy];
    }
    return nil;
}

- (NSArray * _Nullable)arrayWithKey:(NSString *)key
{
    id value = self.dic[key];
    if (NotNull(value) && [value isKindOfClass:[NSArray class]])
    {
        return [value copy];
    }
    return nil;
}

- (NSArray<id<DictionaryParser>> * _Nonnull)arrayWithKey:(NSString *)key type:(Class<DictionaryParser>)type
{
    NSMutableArray<id<DictionaryParser>> *result = [NSMutableArray new];
    
    NSArray *array = [self arrayWithKey:key];
    if (array)
    {
        for (NSDictionary *dictionary in array)
        {
            if ([dictionary isKindOfClass:[NSDictionary class]])
            {
                id entity = [[(Class)type alloc] initWithDictionary:dictionary];
                [result addObject:entity];
            }
        }
    }
    
    return [result copy];
}

- (NSString * _Nullable)stringWithKey:(NSString * _Nonnull)key
{
    id value = self.dic[key];
    if (NotNull(value) && [value isKindOfClass:[NSString class]])
    {
        return [value copy];
    }
    return nil;
}

- (NSNumber * _Nullable)numberWithKey:(NSString *)key
{
    NSNumber *value = self.dic[key];
    if (NotNull(value) && [value isKindOfClass:[NSNumber class]])
    {
        return value;
    }
    return nil;
}

- (BOOL)boolWithKey:(NSString *)key
{
    NSNumber *value = [self numberWithKey:key];
    if (value)
    {
        return value.boolValue;
    }
    return NO;
}

- (UInt64)uint64WithKey:(NSString *)key
{
    NSNumber *value = [self numberWithKey:key];
    if (value)
    {
        return value.unsignedIntegerValue;
    }
    return 0;
}

- (long)longWithKey:(NSString *)key
{
    NSNumber *value = [self numberWithKey:key];
    if (value)
    {
        return value.integerValue;
    }
    return -1;
}

- (Float64)float64WithKey:(NSString *)key
{
    NSNumber *value = [self numberWithKey:key];
    if (value)
    {
        return value.doubleValue;
    }
    return 0;
}

- (NSDate *)dateWithKey:(NSString *)key
{
    id value = self.dic[key];
    if (NotNull(value) && [value isKindOfClass:[NSString class]])
    {
        return [value date];
    }
    return nil;
}

@end
