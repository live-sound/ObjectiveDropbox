//
//  DropboxGetTemporaryLinkResult+DictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 18.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetTemporaryLinkResult+DictionaryParser.h"

@interface DropboxGetTemporaryLinkResultDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxGetTemporaryLinkResult *result;

@end

@implementation DropboxGetTemporaryLinkResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *link = @"a;lsdkf;asldf|";
    DropboxFileMetadata *meta = [DropboxFileMetadata new];
    NSDictionary *dic = @{@"link": link, @"metadata": meta};
    
    self.result = [[DropboxGetTemporaryLinkResult alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.link, link);    
}

- (void)testBadDictionary {
    NSDictionary *dic = @{@"link": @YES};
    
    XCTAssertNoThrow(self.result = [[DropboxGetTemporaryLinkResult alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.result = [[DropboxGetTemporaryLinkResult alloc] initWithDictionary:dic]);
}

@end
