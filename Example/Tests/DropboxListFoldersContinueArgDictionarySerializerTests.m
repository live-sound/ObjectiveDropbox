//
//  DropboxListFoldersContinueArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFoldersContinueArg+DictionarySerializer.h"

@interface DropboxListFoldersContinueArgDictionarySerializerTests : XCTestCase

@property DropboxListFoldersContinueArg *arg;

@end

@implementation DropboxListFoldersContinueArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *cursor = @"a;sdklf;alsdfjk";
    NSDictionary *expectedDic = @{ @"cursor": cursor };
    self.arg = [[DropboxListFoldersContinueArg alloc] initWithCursor:cursor];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testDictionaryWithoutCursor {
    NSDictionary *expectedDic = @{ @"cursor": @"" };
    self.arg = [[DropboxListFoldersContinueArg alloc] init];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
