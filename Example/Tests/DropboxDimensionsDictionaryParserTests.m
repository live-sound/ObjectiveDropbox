//
//  DropboxDimensionsDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 08.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxDimensions+DictionaryParser.h"

@interface DropboxDimensionsDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxDimensions *dim;

@end

@implementation DropboxDimensionsDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    unsigned int width = 12;
    unsigned int height = 14;
    NSDictionary *dic = @{@"width": @(width), @"height": @(height)};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, width);
    XCTAssertEqual(self.dim.height, height);
}

- (void)testFloatDictionary {
    float width = 12.2;
    float height = 14.6;
    NSDictionary *dic = @{@"width": @(width), @"height": @(height)};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, (int)width);
    XCTAssertEqual(self.dim.height, (int)height);
}

- (void)testDictionaryWithoutWidth {
    unsigned int height = 14;
    NSDictionary *dic = @{@"height": @(height)};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, 0);
    XCTAssertEqual(self.dim.height, height);
}

- (void)testDictionaryWithoutHeight {
    unsigned int width = 14;
    NSDictionary *dic = @{@"width": @(width)};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, width);
    XCTAssertEqual(self.dim.height, 0);
}

- (void)testDictionaryWithNSNull {
    NSNull *nul = [NSNull null];
    NSDictionary *dic = @{@"width": nul, @"height": nul};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, 0);
    XCTAssertEqual(self.dim.height, 0);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    self.dim = [[DropboxDimensions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.dim.width, 0);
    XCTAssertEqual(self.dim.height, 0);
}



@end
