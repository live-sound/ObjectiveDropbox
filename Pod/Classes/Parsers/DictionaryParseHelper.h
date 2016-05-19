//
//  DictionaryParseHelper.h
//  Pods
//
//  Created by Михаил Мотыженков on 26.04.16.
//
//

#import <Foundation/Foundation.h>
#import "DictionaryParser.h"

@interface DictionaryParseHelper : NSObject

- (NSDictionary * _Nullable)dictionaryWithKey:(NSString * _Nonnull)key;
- (NSArray * _Nullable)arrayWithKey:(NSString * _Nonnull)key;
- (NSArray<id<DictionaryParser>> * _Nonnull)arrayWithKey:(NSString * _Nonnull)key type:(Class<DictionaryParser> _Nonnull)type;
- (NSString * _Nullable)stringWithKey:(NSString * _Nonnull)key;
- (NSNumber * _Nullable)numberWithKey:(NSString * _Nonnull)key;
- (NSDate * _Nullable)dateWithKey:(NSString * _Nonnull)key;
- (BOOL)boolWithKey:(NSString * _Nonnull)key;
- (UInt64)uint64WithKey:(NSString * _Nonnull)key;
- (long)longWithKey:(NSString * _Nonnull)key;
- (Float64)float64WithKey:(NSString * _Nonnull)key;

- (nonnull instancetype)initWithDictionary:(NSDictionary * _Nonnull)dic;

@end
