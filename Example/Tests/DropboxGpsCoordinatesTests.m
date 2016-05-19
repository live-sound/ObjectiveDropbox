//
//  DropboxGpsCoordinatesTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 11.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGpsCoordinates.h"

@interface DropboxGpsCoordinatesTests : XCTestCase

@property (nonatomic) DropboxGpsCoordinates *sut;

@end

@implementation DropboxGpsCoordinatesTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEqual {
    DropboxGpsCoordinates *another = [DropboxGpsCoordinates new];
    another.latitude = 14;
    another.longitude = 23.3;
    
    self.sut = [DropboxGpsCoordinates new];
    self.sut.latitude = another.latitude;
    self.sut.longitude = another.longitude;
    
    XCTAssertEqualObjects(self.sut, another);
}

- (void)testNotEqualLongitude {
    DropboxGpsCoordinates *another = [DropboxGpsCoordinates new];
    another.latitude = 14;
    another.longitude = 23.3;
    
    self.sut = [DropboxGpsCoordinates new];
    self.sut.latitude = another.latitude;
    self.sut.longitude = 0;
    
    XCTAssertNotEqualObjects(self.sut, another);
}

- (void)testNotEqualLatitude {
    DropboxGpsCoordinates *another = [DropboxGpsCoordinates new];
    another.latitude = 14;
    another.longitude = 23.3;
    
    self.sut = [DropboxGpsCoordinates new];
    self.sut.latitude = 0;
    self.sut.longitude = another.longitude;
    
    XCTAssertNotEqualObjects(self.sut, another);
}


@end
