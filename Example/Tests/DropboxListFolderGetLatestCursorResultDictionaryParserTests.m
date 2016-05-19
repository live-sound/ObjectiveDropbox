//
//  DropboxListFolderGetLatestCursorResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderGetLatestCursorResult+DictionaryParser.h"

@interface DropboxListFolderGetLatestCursorResultDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxListFolderGetLatestCursorResult *result;

@end

@implementation DropboxListFolderGetLatestCursorResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *cursor = @"a ;asd falsdf; askdfj ;";
    NSDictionary *dic = @{@"cursor": cursor};
    
    self.result = [[DropboxListFolderGetLatestCursorResult alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.cursor, cursor);
}

- (void)testBadDictionary {
    id cursor = [NSNull null];
    NSDictionary *dic = @{@"cursor": cursor};
    
    XCTAssertNoThrow(self.result = [[DropboxListFolderGetLatestCursorResult alloc] initWithDictionary:dic]);
    XCTAssertNil(self.result.cursor);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.result = [[DropboxListFolderGetLatestCursorResult alloc] initWithDictionary:dic]);}


@end
