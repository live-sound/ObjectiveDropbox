//
//  EnumToStringSerializer.h
//  Pods
//
//  Created by Михаил Мотыженков on 25.04.16.
//
//

#import <Foundation/Foundation.h>

@protocol EnumToStringSerializer <NSObject>

+ (NSString * _Nullable)stringFromEnum:(NSUInteger)value;

@end
