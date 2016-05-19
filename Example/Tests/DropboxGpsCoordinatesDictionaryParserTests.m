//
//  DropboxGpsCoordinatesDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGpsCoordinates+DictionaryParser.h"

@interface DropboxGpsCoordinatesDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxGpsCoordinates *gps;

@end

@implementation DropboxGpsCoordinatesDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    double latitude = 23.34;
    double longitude = 24234.33;
    NSDictionary *dic = @{@"latitude": @(latitude), @"longitude": @(longitude)};
    
    self.gps = [[DropboxGpsCoordinates alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.gps.latitude, latitude);
    XCTAssertEqual(self.gps.longitude, longitude);
}

- (void)testBadDictionary {
    NSString *latitude = @"sdfs";
    NSDictionary *dic = @{@"latitude": latitude, @"longitude": [NSNull null]};
    
    XCTAssertNoThrow(self.gps = [[DropboxGpsCoordinates alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.gps = [[DropboxGpsCoordinates alloc] initWithDictionary:dic]);
}


@end
