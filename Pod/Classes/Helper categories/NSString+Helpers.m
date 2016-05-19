//
//  NSString+Helpers.m
//  Pods
//
//  Created by Михаил Мотыженков on 19.05.16.
//
//

#import "NSString+Helpers.h"

@implementation NSString (Helpers)

- (NSString *)stringBetweenString1:(NSString *)string1 andString2:(NSString *)string2
{
    NSRange range1 = [self rangeOfString:string1];
    if (range1.length == 0) return nil;
    
    NSUInteger toTheRightFromString1 = range1.location+range1.length;
    NSRange range2 = [[self substringFromIndex:toTheRightFromString1] rangeOfString:string2];
    if (range2.length == 0) return nil;
    
    NSString *result = [self substringWithRange:NSMakeRange(toTheRightFromString1, range2.location-toTheRightFromString1)];
    return result;
}

- (NSString *)stringAfterString:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    if (range.length == 0) return nil;
    
    NSString *result = [self substringFromIndex:range.location+range.length];
    return result;
}

@end
