//
//  NSString+DropboxStringToDate.m
//  Pods
//
//  Created by Михаил Мотыженков on 08.04.16.
//
//

#import "NSString+DropboxStringToDate.h"

@implementation NSString (DropboxStringToDate)

- (NSDate *)date
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    [dateFormat setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDate *result = [dateFormat dateFromString:self];    
    return result;
}

@end
