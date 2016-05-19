//
//  DropboxLinkPermissionsDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxLinkPermissions+DictionaryParser.h"

@interface DropboxLinkPermissionsDictionaryParserTests : XCTestCase

@property DropboxLinkPermissions *result;

@end

@implementation DropboxLinkPermissionsDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSDictionary *dic = @{
                          @"can_revoke": @NO,
                          @"resolved_visibility": @{
                              @".tag": @"public"
                          },
                          @"revoke_failure_reason": @{
                              @".tag": @"owner_only"
                          }
                          };
    
    self.result = [[DropboxLinkPermissions alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.canRevoke, NO);
    XCTAssertEqual(self.result.resolvedVisibility, DResolvedVisibilityPublic);
    XCTAssertEqual(self.result.requestedVisibility, DRVNotSet);
    XCTAssertEqual(self.result.revokeFailureReason, DSLAFROwnerOnly);
}


@end
