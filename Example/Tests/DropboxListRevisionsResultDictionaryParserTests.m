//
//  DropboxListRevisionsResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListRevisionsResult+DictionaryParser.h"

@interface DropboxListRevisionsResultDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxListRevisionsResult *result;

@end

@implementation DropboxListRevisionsResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    BOOL isDeleted = YES;
    NSArray *entries = [NSArray new];
    NSDictionary *dic = @{@"is_deleted": @(isDeleted), @"entries": entries};
    
    self.result = [[DropboxListRevisionsResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.isDeleted, isDeleted);
    XCTAssertNotNil(self.result.entries);
    XCTAssertEqual(self.result.entries.count, 0);
}

- (void)testBadDictionary {
    NSArray *entries = [NSArray new];
    NSDictionary *dic = @{@"is_deleted": @"adsfas", @"entries": entries};
    
    XCTAssertNoThrow(self.result = [[DropboxListRevisionsResult alloc] initWithDictionary:dic]);
    
    XCTAssertNotNil(self.result.entries);
    XCTAssertEqual(self.result.entries.count, 0);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.result = [[DropboxListRevisionsResult alloc] initWithDictionary:dic]);
    
    XCTAssertNotNil(self.result.entries);
    XCTAssertEqual(self.result.entries.count, 0);
}


@end
