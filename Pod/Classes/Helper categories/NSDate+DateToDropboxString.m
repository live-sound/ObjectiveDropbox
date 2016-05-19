//
//  NSDate+DateToDropboxString.m
//  Pods
//
//  Created by Михаил Мотыженков on 21.04.16.
//
//

#import "NSDate+DateToDropboxString.h"

@implementation NSDate (DateToDropboxString)

- (NSString *)dropboxDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    NSString *dateString = [dateFormatter stringFromDate:self];
    return dateString;
}

@end
