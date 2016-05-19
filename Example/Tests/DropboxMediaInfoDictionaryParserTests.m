//
//  DropboxMediaInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMediaInfo+DictionaryParser.h"

@interface DropboxMediaInfoDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxMediaInfo *info;

@end

@implementation DropboxMediaInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithPending {
    NSDictionary *dic = @{ @"pending": @"true"};
    
    self.info = [[DropboxMediaInfo alloc] initWithDictionary:dic];
    
    XCTAssertTrue(self.info.isPending);
    XCTAssertNil(self.info.metadata);
}

- (void)testDictionaryWithMetadata {
    NSDictionary *dic = @{@"metadata": @{}};
    
    self.info = [[DropboxMediaInfo alloc] initWithDictionary:dic];
    
    XCTAssertNotNil(self.info.metadata);
    XCTAssertFalse(self.info.isPending);
}

- (void)testBadDictionary
{
    id nul = [NSNull null];
    NSDictionary *dic = @{@"pending": nul, @"metadata": nul};
    
    XCTAssertNoThrow(self.info = [[DropboxMediaInfo alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.info = [[DropboxMediaInfo alloc] initWithDictionary:dic]);
}


@end
