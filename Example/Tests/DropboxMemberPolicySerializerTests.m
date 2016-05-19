//
//  DropboxMemberPolicySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberPolicySerializer.h"

@interface DropboxMemberPolicySerializerTests : XCTestCase

@end

@implementation DropboxMemberPolicySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTeam {
    DropboxMemberPolicy value = DMPTeam;
    NSString *expectedResult = @"team";
    
    NSString *result = [DropboxMemberPolicySerializer stringFromEnum:value];
    
    XCTAssertEqualObjects(result, expectedResult);
}

- (void)testAnyone {
    DropboxMemberPolicy value = DMPAnyone;
    NSString *expectedResult = @"anyone";
    
    NSString *result = [DropboxMemberPolicySerializer stringFromEnum:value];
    
    XCTAssertEqualObjects(result, expectedResult);
}


- (void)testNotSet {
    DropboxMemberPolicy value = 123123;
    
    NSString *result = [DropboxMemberPolicySerializer stringFromEnum:value];
    
    XCTAssertNil(result);
}



@end
