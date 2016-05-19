//
//  DropboxPollArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxPollArg.h"

@interface DropboxPollArgTests : XCTestCase

@property DropboxPollArg *arg;

@end

@implementation DropboxPollArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *ID = @"a;dsklfj;asldfj";
    
    self.arg = [[DropboxPollArg alloc] initWithAsyncJobID:ID];
    
    XCTAssertEqualObjects(self.arg.asyncJobID, ID);
}


@end
