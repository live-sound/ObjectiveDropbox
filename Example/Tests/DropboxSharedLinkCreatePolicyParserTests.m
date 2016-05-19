//
//  DropboxSharedLinkCreatePolicyParser.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkCreatePolicyParser.h"

@interface DropboxSharedLinkCreatePolicyParserTests : XCTestCase

@end

@implementation DropboxSharedLinkCreatePolicyParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringDefaultPublic {
    NSString *value = @"default_public";
    DropboxSharedLinkCreatePolicy expectedResult = DSLCPDefaultPublic;
    
    DropboxSharedLinkCreatePolicy result = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringDefaultTeamOnly {
    NSString *value = @"default_team_only";
    DropboxSharedLinkCreatePolicy expectedResult = DSLCPDefaultTeamOnly;
    
    DropboxSharedLinkCreatePolicy result = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringTeamOnly {
    NSString *value = @"team_only";
    DropboxSharedLinkCreatePolicy expectedResult = DSLCPTeamOnly;
    
    DropboxSharedLinkCreatePolicy result = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringUnknown {
    NSString *value = @"asdfasdf";
    DropboxSharedLinkCreatePolicy expectedResult = DSLCPNotSet;
    
    DropboxSharedLinkCreatePolicy result = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testDictionary {
    NSString *value = @"default_public";
    DropboxSharedLinkCreatePolicy expectedResult = DSLCPDefaultPublic;
    NSDictionary *dic = @{ @".tag": value };
    
    DropboxSharedLinkCreatePolicy result = [DropboxSharedLinkCreatePolicyParser sharedLinkCreatePolicyFromDictionary:dic];
    
    XCTAssertEqual(result, expectedResult);
}


@end
