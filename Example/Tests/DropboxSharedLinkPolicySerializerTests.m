//
//  DropboxSharedLinkPolicySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkPolicySerializer.h"

@interface DropboxSharedLinkPolicySerializerTests : XCTestCase

@end

@implementation DropboxSharedLinkPolicySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAnyone {
    DropboxSharedLinkPolicy value = DSLPAnyone;
    NSString *expectedString = @"anyone";
    
    NSString *string = [DropboxSharedLinkPolicySerializer stringFromEnum:value];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testMembers {
    DropboxSharedLinkPolicy value = DSLPMembers;
    NSString *expectedString = @"members";
    
    NSString *string = [DropboxSharedLinkPolicySerializer stringFromEnum:value];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testUnknown {
    DropboxSharedLinkPolicy value = 100500;
    
    NSString *string = [DropboxSharedLinkPolicySerializer stringFromEnum:value];
    
    XCTAssertNil(string);
}


@end
