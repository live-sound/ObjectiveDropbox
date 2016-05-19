//
//  DropboxListRevisionsArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListRevisionsArg+DictionarySerializer.h"

@interface DropboxListRevisionsArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxListRevisionsArg *arg;

@end

@implementation DropboxListRevisionsArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/";
    UInt64 limit = 5;
    self.arg = [[DropboxListRevisionsArg alloc] initWithPath:path limit:limit];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @"path": self.arg.path, @"limit": @(self.arg.limit) };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
