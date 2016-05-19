//
//  DropboxDimensionsTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 11.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxDimensions.h"

@interface DropboxDimensionsTests : XCTestCase

@property (nonatomic) DropboxDimensions *dim;

@end

@implementation DropboxDimensionsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEqual {
    self.dim = [DropboxDimensions new];
    self.dim.width = 20.3;
    self.dim.height = 33.2;
    
    DropboxDimensions *dim2 = [DropboxDimensions new];
    dim2.width = self.dim.width;
    dim2.height = self.dim.height;
    
    XCTAssertEqualObjects(self.dim, dim2);
}

- (void)testNotEqualHeight {
    self.dim = [DropboxDimensions new];
    self.dim.width = 20.3;
    self.dim.height = 33.2;
    
    DropboxDimensions *dim2 = [DropboxDimensions new];
    dim2.width = self.dim.width;
    dim2.height = 0;
    
    XCTAssertNotEqualObjects(self.dim, dim2);
}

- (void)testNotEqualWidth {
    self.dim = [DropboxDimensions new];
    self.dim.width = 20.3;
    self.dim.height = 33.2;
    
    DropboxDimensions *dim2 = [DropboxDimensions new];
    dim2.width = 0;
    dim2.height = self.dim.height;
    
    XCTAssertNotEqualObjects(self.dim, dim2);
}


@end
