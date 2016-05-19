//
//  DropboxListFolerMembersContinueArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderMembersContinueArg+DictionarySerializer.h"

@interface DropboxListFolerMembersContinueArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxListFolerMembersContinueArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *cursor = @"a;sldjf;alsdfk";
    NSDictionary *expectedDic = @{ @"cursor": cursor };
    DropboxListFolderMembersContinueArg *arg = [[DropboxListFolderMembersContinueArg alloc] initWithCursor:cursor];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
