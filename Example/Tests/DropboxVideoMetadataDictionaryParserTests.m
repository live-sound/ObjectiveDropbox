//
//  DropboxVideoMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxVideoMetadata+DictionaryParser.h"

@interface DropboxVideoMetadataDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxVideoMetadata *meta;

@end

@implementation DropboxVideoMetadataDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    UInt64 duration = 24;
    NSDictionary *dic = @{@"duration": @(duration)};
    
    self.meta = [[DropboxVideoMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.meta.duration, duration);
}

- (void)testBadDictionary {
    NSDictionary *dic = @{@"duration": @"asdf"};
    
    XCTAssertNoThrow(self.meta = [[DropboxVideoMetadata alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.meta = [[DropboxVideoMetadata alloc] initWithDictionary:dic]);
}


@end
