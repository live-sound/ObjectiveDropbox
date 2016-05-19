//
//  DropboxMemberPermissionDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberPermission+DictionaryParser.h"

@interface DropboxMemberPermissionDictionaryParserTests : XCTestCase

@end

@implementation DropboxMemberPermissionDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    BOOL allow = YES;
    DropboxMemberAction action = DMAMakeOwner;
    DropboxPermissionDeniedReason reason = DPDRUserNotSameTeamAsOwner;
    NSDictionary *dic = @{ @"action": @"make_owner",
                           @"allow": @(allow),
                           @"reason": @"user_not_same_team_as_owner"
                         };
    
    DropboxMemberPermission *permission = [[DropboxMemberPermission alloc] initWithDictionary:dic];
    
    XCTAssertEqual(permission.action, action);
    XCTAssertEqual(permission.allow, allow);
    XCTAssertEqual(permission.reason, reason);
}


@end
