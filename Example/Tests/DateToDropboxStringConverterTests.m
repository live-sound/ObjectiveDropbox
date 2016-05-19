//
//  DropboxDateToDropboxStringConverterTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSDate+DateToDropboxString.h"

@interface DateToDropboxStringConverterTests : XCTestCase

@end

@implementation DateToDropboxStringConverterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConverter
{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.year = 2015;
    comps.month = 5;
    comps.day = 12;
    comps.hour = 15;
    comps.minute = 50;
    comps.second = 38;
    NSDate *date = [gregorian dateFromComponents:comps];
    
    NSString *sut = [date dropboxDate];
    NSString *expectedString = [NSString stringWithFormat:@"%02ld-%02ld-%02ldT%02ld:%02ld:%02ldZ", (long)comps.year, (long)comps.month, (long)comps.day, (long)comps.hour, (long)comps.minute, (long)comps.second];
    
    XCTAssertEqualObjects(sut, expectedString);
}



@end
