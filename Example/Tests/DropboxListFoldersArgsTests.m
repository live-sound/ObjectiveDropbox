//
//  DropboxListFoldersArgs.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFoldersArgs.h"

@interface DropboxListFoldersArgsTests : XCTestCase

@property DropboxListFoldersArgs *arg;

@end

@implementation DropboxListFoldersArgsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    UInt32 limit = 234;
    
    self.arg = [[DropboxListFoldersArgs alloc] initWithLimit:limit actions:DFAEditContents, DFAUnshare, nil];
    
    XCTAssertEqual(self.arg.limit, limit);
    XCTAssertEqual(self.arg.actions.count, 2);
    XCTAssertEqual(self.arg.actions[0], @(DFAEditContents));
    XCTAssertEqual(self.arg.actions[1], @(DFAUnshare));
}

- (void)testShortInit {
    UInt32 limit = 234;
    
    self.arg = [[DropboxListFoldersArgs alloc] initWithLimit:limit];
    
    XCTAssertEqual(self.arg.limit, limit);
    XCTAssertNotNil(self.arg.actions);
    XCTAssertEqual(self.arg.actions.count, 0);
}

- (void)testDefaultInit {
    UInt32 limit = 1000;
    
    self.arg = [[DropboxListFoldersArgs alloc] init];
    
    XCTAssertEqual(self.arg.limit, limit);
    XCTAssertNotNil(self.arg.actions);
    XCTAssertEqual(self.arg.actions.count, 0);
}


@end
