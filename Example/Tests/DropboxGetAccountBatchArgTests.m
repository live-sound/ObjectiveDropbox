//
//  DropboxGetAccountBatchArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetAccountBatchArg.h"

@interface DropboxGetAccountBatchArgTests : XCTestCase

@property DropboxGetAccountBatchArg *arg;

@end

@implementation DropboxGetAccountBatchArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    self.arg = [[DropboxGetAccountBatchArg alloc] initWithAccountIDs:@"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", @"dbid:AAH1Vcz-DVoRDeixtr_OA8oUGgiqhs4XPOQ", nil];
    
    XCTAssertEqual(self.arg.accountIDs.count, 2);
    XCTAssertEqualObjects(self.arg.accountIDs[0], @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc");
    XCTAssertEqualObjects(self.arg.accountIDs[1], @"dbid:AAH1Vcz-DVoRDeixtr_OA8oUGgiqhs4XPOQ");
}


@end
