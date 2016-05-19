//
//  DropboxUploadSessionStartArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionStartArg.h"

@interface DropboxUploadSessionStartArgTests : XCTestCase

@property DropboxUploadSessionStartArg *arg;

@end

@implementation DropboxUploadSessionStartArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    BOOL close = YES;
    
    self.arg = [[DropboxUploadSessionStartArg alloc] initWithClose:close];
    
    XCTAssertEqual(self.arg.close, close);
}


@end
