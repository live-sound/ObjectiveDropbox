//
//  DropboxSearchArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSearchArg.h"

@interface DropboxSearchArgTests : XCTestCase

@property (nonatomic) DropboxSearchArg *arg;

@end

@implementation DropboxSearchArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *path = @"as;dlfj;asdf";
    NSString *query = @"a;sldfj;alsdfkj";
    UInt64 start = 2;
    UInt64 maxResults = 234234;
    DropboxSearchMode mode = fileNameAndContent;
    
    self.arg = [[DropboxSearchArg alloc] initWithPath:path query:query start:start maxResults:maxResults mode:mode];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.query, query);
    XCTAssertEqual(self.arg.start, start);
    XCTAssertEqual(self.arg.maxResults, maxResults);
    XCTAssertEqual(self.arg.mode, mode);
}

- (void)testShortInit {
    NSString *path = @"as;dlfj;asdf";
    NSString *query = @"a;sldfj;alsdfkj";
    
    UInt64 start = 0;
    UInt64 maxResults = 100;
    DropboxSearchMode mode = fileName;
    
    self.arg = [[DropboxSearchArg alloc] initWithPath:path query:query];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.query, query);
    XCTAssertEqual(self.arg.start, start);
    XCTAssertEqual(self.arg.maxResults, maxResults);
    XCTAssertEqual(self.arg.mode, mode);
}


@end
