//
//  DropboxGetAccountArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetAccountArg.h"

@interface DropboxGetAccountArgTests : XCTestCase

@property DropboxGetAccountArg *arg;

@end

@implementation DropboxGetAccountArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *ID = @"a;sdljf;alsdkf";
    
    self.arg = [[DropboxGetAccountArg alloc] initWithAccountID:ID];
    
    XCTAssertEqualObjects(self.arg.accountID, ID);
}

- (void)testDefaultInit {
    self.arg = [[DropboxGetAccountArg alloc] init];
    
    XCTAssertNotNil(self.arg.accountID);
}


@end
