//
//  DropboxRemoveFolderMemberArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRemoveFolderMemberArg.h"

@interface DropboxRemoveFolderMemberArgTests : XCTestCase

@property DropboxRemoveFolderMemberArg *arg;

@end

@implementation DropboxRemoveFolderMemberArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *ID = @"a;slkdf;adksfj";
    DropboxMemberSelector *member = [DropboxMemberSelector new];
    BOOL copy = YES;
    
    self.arg = [[DropboxRemoveFolderMemberArg alloc] initWithSharedFolderID:ID member:member leaveACopy:copy];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqualObjects(self.arg.member, member);
    XCTAssertEqual(self.arg.leaveACopy, copy);
}


@end
