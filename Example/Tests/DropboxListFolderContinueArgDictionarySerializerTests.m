//
//  DropboxListFolderContinueArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderContinueArg+DictionarySerializer.h"

@interface DropboxListFolderContinueArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxListFolderContinueArg *arg;

@end

@implementation DropboxListFolderContinueArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *cursor = @"~";
    self.arg = [[DropboxListFolderContinueArg alloc] initWithCursor:cursor];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{@"cursor": self.arg.cursor};
    XCTAssertEqualObjects(dic, expectedDic);
}

@end
