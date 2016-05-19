//
//  DropboxSearchMatchTypeParseManagerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSearchMatchTypeParseManager.h"

@interface DropboxSearchMatchTypeParseManagerTests : XCTestCase

@end

@implementation DropboxSearchMatchTypeParseManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionaryWithFilename {
    NSDictionary *dic = @{@".tag": @"filename"};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, filename);
}

- (void)testGoodDictionaryWithContent {
    NSDictionary *dic = @{@".tag": @"content"};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, content);
}

- (void)testGoodDictionaryWithBoth {
    NSDictionary *dic = @{@".tag": @"both"};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, both);
}

- (void)testBadDictionaryWithBadValue {
    NSDictionary *dic = @{@".tag": @"asdfasd"};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, unknown);
}

- (void)testBadDictionaryWithBadKey {
    NSDictionary *dic = @{@"tag!": @"both"};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, unknown);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromDictionary:dic];
    
    XCTAssertEqual(dsmt, unknown);
}

- (void)testGoodStringWithFilename {
    NSString *string = @"filename";
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromString:string];
    
    XCTAssertEqual(dsmt, filename);
}

- (void)testGoodStringWithContent {
    NSString *string = @"content";
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromString:string];
    
    XCTAssertEqual(dsmt, content);
}

- (void)testGoodStringWithBoth {
    NSString *string = @"both";
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromString:string];
    
    XCTAssertEqual(dsmt, both);
}

- (void)testBadString {
    NSString *string = @"asdfasdf";
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromString:string];
    
    XCTAssertEqual(dsmt, unknown);
}

- (void)testEmptyString {
    NSString *string = @"";
    
    DropboxSearchMatchType dsmt = [DropboxSearchMatchTypeParseManager searchMatchTypeFromString:string];
    
    XCTAssertEqual(dsmt, unknown);
}


@end
