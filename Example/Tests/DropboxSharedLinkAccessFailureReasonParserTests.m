//
//  DropboxSharedLinkAccessFailureReasonParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkAccessFailureReasonParser.h"

@interface DropboxSharedLinkAccessFailureReasonParserTests : XCTestCase

@property DropboxSharedLinkAccessFailureReason reason;

@end

@implementation DropboxSharedLinkAccessFailureReasonParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *value = @"email_verify_required";
    NSDictionary *dic = @{ @".tag": value };
    
    self.reason = [DropboxSharedLinkAccessFailureReasonParser reasonFromDictionary:dic];
    
    XCTAssertEqual(self.reason, DSLAFREmailVerifyRequired);
}

- (void)testString {
    NSString *value = @"password_required";
    
    self.reason = [DropboxSharedLinkAccessFailureReasonParser reasonFromString:value];
    
    XCTAssertEqual(self.reason, DSLAFRPasswordRequired);
}


@end
