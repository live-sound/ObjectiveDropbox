//
//  NSArray+ArrayOfStrings.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>
#import "EnumToStringSerializer.h"

@interface NSArray<NSNumber> (ArrayOfStrings)

- (NSArray<NSString *> * _Nonnull)arrayOfStringsWithSerializer:(Class<EnumToStringSerializer> _Nonnull)serializerType;

@end
