//
//  DropboxDropboxAccessLevelDictionarySeriailzerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAccessLevelDictionarySerializer.h"

@interface DropboxDropboxAccessLevelDictionarySeriailzerTests : XCTestCase

@end

@implementation DropboxDropboxAccessLevelDictionarySeriailzerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testOwner {
    NSDictionary *dic = [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:DALOwner];
    
    NSDictionary *expectedDic = @{ @".tag": @"owner" };
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testEditor {
    NSDictionary *dic = [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:DALEditor];
    
    NSDictionary *expectedDic = @{ @".tag": @"editor" };
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testViewer {
    NSDictionary *dic = [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:DALViewer];
    
    NSDictionary *expectedDic = @{ @".tag": @"viewer" };
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testUnknown {    
    NSDictionary *dic = [DropboxAccessLevelDictionarySerializer dictionaryFromAccessLevel:100500];
    
    NSDictionary *expectedDic = @{ };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
