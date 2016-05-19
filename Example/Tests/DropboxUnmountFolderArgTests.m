//
//  DropboxUnmountFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUnmountFolderArg.h"

@interface DropboxUnmountFolderArgTests : XCTestCase

@property DropboxUnmountFolderArg *arg;

@end

@implementation DropboxUnmountFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *ID = @"aa;sldfj;alsjdf";
    
    self.arg = [[DropboxUnmountFolderArg alloc] initWithSharedFolderID:ID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
}

- (void)testDefaultInit {
    NSString *ID = @"";
    
    self.arg = [[DropboxUnmountFolderArg alloc] init];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
}


@end
