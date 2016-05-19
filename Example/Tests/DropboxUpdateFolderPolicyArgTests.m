//
//  DropboxUpdateFolderPolicyArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUpdateFolderPolicyArg.h"

@interface DropboxUpdateFolderPolicyArgTests : XCTestCase

@property DropboxUpdateFolderPolicyArg *arg;

@end

@implementation DropboxUpdateFolderPolicyArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *ID = @"a;lskdjf;alsdf";
    DropboxMemberPolicy memberPolicy = DMPNotSet;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPEditors;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPMembers;
    
    self.arg = [[DropboxUpdateFolderPolicyArg alloc] initWithSharedFolderID:ID memberPolicy:memberPolicy aclUpdatePolicy:aclUpdatePolicy sharedLinkPolicy:sharedLinkPolicy];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
}

- (void)testShortInit {
    NSString *ID = @"a;lskdjf;alsdf";
    DropboxMemberPolicy memberPolicy = DMPNotSet;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPNotSet;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPNotSet;
    
    self.arg = [[DropboxUpdateFolderPolicyArg alloc] initWithSharedFolderID:ID];
    
    XCTAssertEqualObjects(self.arg.sharedFolderID, ID);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
}

- (void)testDefaultInit {
    DropboxMemberPolicy memberPolicy = DMPNotSet;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPNotSet;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPNotSet;
    
    self.arg = [[DropboxUpdateFolderPolicyArg alloc] init];
    
    XCTAssertNotNil(self.arg.sharedFolderID);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
}


@end
