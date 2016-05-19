//
//  DropboxGetTemporaryLinkArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetTemporaryLinkArg.h"

@interface DropboxGetTemporaryLinkArgTests : XCTestCase

@property (nonatomic) DropboxGetTemporaryLinkArg *arg;

@end

@implementation DropboxGetTemporaryLinkArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *path = @"";
    
    self.arg = [[DropboxGetTemporaryLinkArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
}


@end
