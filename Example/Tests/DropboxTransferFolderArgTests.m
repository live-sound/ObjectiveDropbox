//
//  DropboxTransferFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTransferFolderArg.h"

@interface DropboxTransferFolderArgTests : XCTestCase

@property DropboxTransferFolderArg *arg;

@end

@implementation DropboxTransferFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *sharedFolderID = @"a;sldf;lasjdf";
    NSString *toDropboxID = @"a;skldjf;alsdf";
    
    self.arg = [[DropboxTransferFolderArg alloc] initWithSharedFolderID:sharedFolderID toDropboxID:toDropboxID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertEqualObjects(self.arg.toDropboxID, toDropboxID);
}

- (void)testDefaultInit {
    NSString *sharedFolderID = @"";
    NSString *toDropboxID = @"";
    
    self.arg = [[DropboxTransferFolderArg alloc] init];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertEqualObjects(self.arg.toDropboxID, toDropboxID);
}


@end
