//
//  DropboxAddFolderMemberArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAddFolderMemberArg.h"

@interface DropboxAddFolderMemberArgTests : XCTestCase

@property DropboxAddFolderMemberArg *arg;

@end

@implementation DropboxAddFolderMemberArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *sharedFolderID = @"a;sdlkfja;sldfj";
    NSArray *members = [NSArray new];
    BOOL quiet = YES;
    NSString *customMessage = @"a;lsdfl;askfj";
    
    self.arg = [[DropboxAddFolderMemberArg alloc] initWithSharedFolderID:sharedFolderID members:members quiet:quiet customMessage:customMessage];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertEqualObjects(self.arg.members, members);
    XCTAssertEqual(self.arg.quiet, quiet);
    XCTAssertEqualObjects(self.arg.customMessage, customMessage);
}


@end
