//
//  DropboxUpdateFolderMemberArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUpdateFolderMemberArg.h"

@interface DropboxUpdateFolderMemberArgTests : XCTestCase

@property DropboxUpdateFolderMemberArg *arg;

@end

@implementation DropboxUpdateFolderMemberArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testeFullInit {
    NSString *sharedFolderID = @"a;lskdjf;alsdfj";
    DropboxMemberSelector *member = [[DropboxMemberSelector alloc] initWithEmail:@"a;sldjf;alsdf"];
    DropboxAccessLevel accessLevel = DALEditor;
    
    self.arg = [[DropboxUpdateFolderMemberArg alloc] initWithSharedFolderID:sharedFolderID member:member accessLevel:accessLevel];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, sharedFolderID);
    XCTAssertEqualObjects(self.arg.member, member);
    XCTAssertEqual(self.arg.accessLevel, accessLevel);
}

- (void)testeDefaultInit {
    self.arg = [[DropboxUpdateFolderMemberArg alloc] init];
    
    XCTAssertNotNil(self.arg.sharedFolderID);
    XCTAssertNotNil(self.arg.member);
    XCTAssertEqual(self.arg.accessLevel, DALNotSet);
}


@end
