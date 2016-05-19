//
//  DropboxRevokeSharedLinkArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRevokeSharedLinkArg.h"

@interface DropboxRevokeSharedLinkArgTests : XCTestCase

@property DropboxRevokeSharedLinkArg *arg;

@end

@implementation DropboxRevokeSharedLinkArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *url = @"a;lsdjf;alsdfk";
    
    self.arg = [[DropboxRevokeSharedLinkArg alloc] initWithURL:url];
    
    XCTAssertEqualObjects(self.arg.url, url);
}

- (void)testShortInit {
    NSString *url = @"";
    
    self.arg = [[DropboxRevokeSharedLinkArg alloc] init];
    
    XCTAssertEqualObjects(self.arg.url, url);
}


@end
