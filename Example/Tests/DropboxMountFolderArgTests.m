//
//  DropboxMountFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMountFolderArg.h"

@interface DropboxMountFolderArgTests : XCTestCase

@property DropboxMountFolderArg *arg;

@end

@implementation DropboxMountFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *ID = @"a;slkdf;lasdf";
    
    self.arg = [[DropboxMountFolderArg alloc] initWithSharedFolderID:ID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
}

- (void)testShortInit {
    NSString *ID = @"";
    
    self.arg = [[DropboxMountFolderArg alloc] init];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
}


@end
