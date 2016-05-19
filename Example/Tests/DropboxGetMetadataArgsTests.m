//
//  DropboxGetMetadataArgsTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetMetadataArgs.h"

@interface DropboxGetMetadataArgsTests : XCTestCase

@property DropboxGetMetadataArgs *arg;

@end

@implementation DropboxGetMetadataArgsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testShortInit {
    NSString *sharedFolderID = @"a;dkfja;sldfk";
    
    self.arg = [[DropboxGetMetadataArgs alloc] initWithSharedFolderID:sharedFolderID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertNil(self.arg.actions);
}

- (void)testFullInit
{
    NSString *sharedFolderID = @"a;dkfja;sldfk";
    
    self.arg = [[DropboxGetMetadataArgs alloc] initWithSharedFolderID:sharedFolderID actions:DFAEditContents, DFAInviteViewer, nil];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertEqual(self.arg.actions.count, 2);
    XCTAssertEqual(self.arg.actions[0], @(DFAEditContents));
    XCTAssertEqual(self.arg.actions[1], @(DFAInviteViewer));
}


@end
