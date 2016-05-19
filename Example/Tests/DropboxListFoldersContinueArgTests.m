//
//  DropboxListFoldersContinueArg.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFoldersContinueArg.h"

@interface DropboxListFoldersContinueArgTests : XCTestCase

@property DropboxListFoldersContinueArg *arg;

@end

@implementation DropboxListFoldersContinueArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *cursor = @"a;sdkfj;asldfjk";
    
    self.arg = [[DropboxListFoldersContinueArg alloc] initWithCursor:cursor];
    
    XCTAssertEqualObjects(self.arg.cursor, cursor);
}


@end
