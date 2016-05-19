//
//  DropboxListSharedLinksArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListSharedLinksArg.h"

@interface DropboxListSharedLinksArgTests : XCTestCase

@property DropboxListSharedLinksArg *arg;

@end

@implementation DropboxListSharedLinksArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *path = @"aalsdjlf;asdf";
    NSString *cursor = @"a;sldfj;lasdfjk";
    BOOL direct = YES;
    
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:path cursor:cursor directOnly:direct];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.cursor, cursor);
    XCTAssertEqual(self.arg.directOnly, direct);
}

- (void)testInitWithPathAndCursor {
    NSString *path = @"aalsdjlfdf";
    NSString *cursor = @"a;lasdfjk";
    BOOL direct = NO;
    
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:path cursor:cursor];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.cursor, cursor);
    XCTAssertEqual(self.arg.directOnly, direct);
}

- (void)testInitWithPath {
    NSString *path = @"aalsdjlfdf";
    BOOL direct = NO;
    
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertNil(self.arg.cursor);
    XCTAssertEqual(self.arg.directOnly, direct);
}

- (void)testInit {
    BOOL direct = NO;
    
    self.arg = [[DropboxListSharedLinksArg alloc] init];
    
    XCTAssertNil(self.arg.path);
    XCTAssertNil(self.arg.cursor);
    XCTAssertEqual(self.arg.directOnly, direct);
}

@end
