//
//  DropboxWriteModeTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxWriteMode.h"

@interface DropboxWriteModeTests : XCTestCase

@property (nonatomic) DropboxWriteMode *arg;

@end

@implementation DropboxWriteModeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithAdd {
    DropboxWriteModeEnum mode = DWMAdd;
    
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:nil];
    
    XCTAssertEqual(self.arg.mode, mode);
    XCTAssertNil(self.arg.updateString);
}

- (void)testInitWithOverwrite {
    DropboxWriteModeEnum mode = DWMOverwrite;
    
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:nil];
    
    XCTAssertEqual(self.arg.mode, mode);
    XCTAssertNil(self.arg.updateString);
}

- (void)testInitWithUpdate {
    DropboxWriteModeEnum mode = DWMUpdate;
    NSString *updateString = @"a;dlfas;ldfa";
    
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:updateString];
    
    XCTAssertEqual(self.arg.mode, mode);
    XCTAssertEqualObjects(self.arg.updateString, updateString);
}


@end
