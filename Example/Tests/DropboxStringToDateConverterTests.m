//
//  DropboxStringToDateConverterTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 12.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSString+DropboxStringToDate.h"

@interface DropboxStringToDateConverterTests : XCTestCase

@property (nonatomic) NSDate *date;

@end

@implementation DropboxStringToDateConverterTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodString {
    NSString *dateString = @"2015-05-12T15:50:38Z";
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    comps.year = 2015;
    comps.month = 5;
    comps.day = 12;
    comps.hour = 15;
    comps.minute = 50;
    comps.second = 38;
    NSDate *expectedDate = [gregorian dateFromComponents:comps];
    
    self.date = [dateString date];
    
    XCTAssertEqualObjects(self.date, expectedDate);
}

- (void)testBadString {
    NSString *dateString = @"al;skdjf;lasdfj;";
    
    self.date = [dateString date];
    
    XCTAssertNil(self.date);
}

- (void)testEmptyString {
    NSString *dateString = @"";
    
    self.date = [dateString date];
    
    XCTAssertNil(self.date);
}


@end
