//
//  DropboxListFoldersArgsDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFoldersArgs+DictionarySerializer.h"

@interface DropboxListFoldersArgsDictionarySerializerTests : XCTestCase

@property DropboxListFoldersArgs *arg;

@end

@implementation DropboxListFoldersArgsDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithActions {
    UInt32 limit = 23423;
    self.arg = [[DropboxListFoldersArgs alloc] initWithLimit:limit actions:DFAUnmount, nil];
    NSDictionary *expectedDic = @{ @"limit": @(limit),
                                   @"actions": @[@"unmount"] };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testDictionaryWithoutActions {
    UInt32 limit = 2000;
    self.arg = [[DropboxListFoldersArgs alloc] initWithLimit:limit];
    NSDictionary *expectedDic = @{ @"limit": @(limit),
                                   @"actions": @[] };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
