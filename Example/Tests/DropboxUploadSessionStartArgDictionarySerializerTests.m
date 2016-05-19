//
//  DropboxUploadSessionStartArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionStartArg+DictionarySerializer.h"

@interface DropboxUploadSessionStartArgDictionarySerializerTests : XCTestCase

@property DropboxUploadSessionStartArg *arg;

@end

@implementation DropboxUploadSessionStartArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    BOOL close = YES;
    self.arg = [[DropboxUploadSessionStartArg alloc] initWithClose:close];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"close": @(close)
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
