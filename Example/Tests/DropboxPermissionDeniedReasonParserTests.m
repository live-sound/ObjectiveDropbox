//
//  DropboxPermissionDeniedReasonParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxPermissionDeniedReasonParser.h"

@interface DropboxPermissionDeniedReasonParserTests : XCTestCase

@end

@implementation DropboxPermissionDeniedReasonParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserNotSame {
    NSString *value = @"user_not_same_team_as_owner";
    DropboxPermissionDeniedReason expectedReason = DPDRUserNotSameTeamAsOwner;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testUserNotAllowed {
    NSString *value = @"user_not_allowed_by_owner";
    DropboxPermissionDeniedReason expectedReason = DPDRUserNotAllowedByOwner;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testTargetIsIndirectMember {
    NSString *value = @"target_is_indirect_member";
    DropboxPermissionDeniedReason expectedReason = DPDRTargetIsIndirectMember;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testTargetIsOwner {
    NSString *value = @"target_is_owner";
    DropboxPermissionDeniedReason expectedReason = DPDRTargetIsOwner;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testTargetIsSelf {
    NSString *value = @"target_is_self";
    DropboxPermissionDeniedReason expectedReason = DPDRTargetIsSelf;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testTargetNotActive {
    NSString *value = @"target_not_active";
    DropboxPermissionDeniedReason expectedReason = DPDRTargetNotActive;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}

- (void)testUnknownValue {
    NSString *value = @"asfasdfasdf";
    DropboxPermissionDeniedReason expectedReason = DPDRNotSet;
    
    DropboxPermissionDeniedReason reason = [DropboxPermissionDeniedReasonParser permissionDeniedReasonFromString:value];
    
    XCTAssertEqual(reason, expectedReason);
}


@end
