//
//  DropboxListFolderLongpollResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderLongpollResult+DictionaryParser.h"

@interface DropboxListFolderLongpollResultDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxListFolderLongpollResult *result;

@end

@implementation DropboxListFolderLongpollResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    BOOL changes = YES;
    UInt64 backoff = 142343;
    NSDictionary *dic = @{@"changes": @(changes), @"backoff": @(backoff)};
    
    self.result = [[DropboxListFolderLongpollResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.changes, changes);
    XCTAssertNotNil(self.result.backoff);
    XCTAssertEqual([self.result.backoff integerValue], backoff);
}

- (void)testBadDictionary {
    NSDictionary *dic = @{@"backoff": @"sadfsa"};
    
    XCTAssertNotNil(self.result = [[DropboxListFolderLongpollResult alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.result.backoff);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNotNil(self.result = [[DropboxListFolderLongpollResult alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.result.backoff);
}


@end
