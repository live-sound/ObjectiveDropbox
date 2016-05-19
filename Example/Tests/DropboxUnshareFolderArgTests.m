//
//  DropboxUnshareFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUnshareFolderArg.h"

@interface DropboxUnshareFolderArgTests : XCTestCase

@property DropboxUnshareFolderArg *arg;

@end

@implementation DropboxUnshareFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *ID = @"a;sldjf;alsjdfk";
    BOOL copy = YES;
    
    self.arg = [[DropboxUnshareFolderArg alloc] initWithSharedFolderID:ID leaveACopy:copy];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqual(self.arg.leaveACopy, copy);
}

- (void)testShortInit {
    NSString *ID = @"a;sldjf;alsjdfk";
    BOOL copy = NO;
    
    self.arg = [[DropboxUnshareFolderArg alloc] initWithSharedFolderID:ID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqual(self.arg.leaveACopy, copy);
}

- (void)testDefaultInit {
    NSString *ID = @"";
    BOOL copy = NO;
    
    self.arg = [[DropboxUnshareFolderArg alloc] init];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqual(self.arg.leaveACopy, copy);
}


@end
