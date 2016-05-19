//
//  DropboxShareFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxShareFolderArg.h"

@interface DropboxShareFolderArgTests : XCTestCase

@property DropboxShareFolderArg *arg;

@end

@implementation DropboxShareFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *path = @"a;adasdf;jld";
    DropboxMemberPolicy memberPolicy = DMPTeam;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPOwner;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPAnyone;
    BOOL forceAsync = YES;
    
    self.arg = [[DropboxShareFolderArg alloc] initWithPath:path memberPolicy:memberPolicy aclUpdatePolicy:aclUpdatePolicy sharedLinkPolicy:sharedLinkPolicy forceAsync:forceAsync];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
    XCTAssertEqual(self.arg.forceAsync, forceAsync);
}

- (void)testShortInit {
    NSString *path = @"a;;jld";
    DropboxMemberPolicy memberPolicy = DMPAnyone;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPOwner;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPAnyone;
    BOOL forceAsync = NO;
    
    self.arg = [[DropboxShareFolderArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
    XCTAssertEqual(self.arg.forceAsync, forceAsync);
}

- (void)testDefaultInit {
    NSString *path = @"/";
    DropboxMemberPolicy memberPolicy = DMPAnyone;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPOwner;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPAnyone;
    BOOL forceAsync = NO;
    
    self.arg = [[DropboxShareFolderArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.memberPolicy, memberPolicy);
    XCTAssertEqual(self.arg.aclUpdatePolicy, aclUpdatePolicy);
    XCTAssertEqual(self.arg.sharedLinkPolicy, sharedLinkPolicy);
    XCTAssertEqual(self.arg.forceAsync, forceAsync);
}


@end
