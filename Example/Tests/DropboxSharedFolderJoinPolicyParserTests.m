//
//  DropboxSharedFolderJoinPolicyParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedFolderJoinPolicyParser.h"

@interface DropboxSharedFolderJoinPolicyParserTests : XCTestCase

@end

@implementation DropboxSharedFolderJoinPolicyParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringTeam {
    NSString *value = @"from_team_only";
    DropboxSharedFolderJoinPolicy expectedResult = DSFJPFromTeamOnly;
    
    DropboxSharedFolderJoinPolicy result = [DropboxSharedFolderJoinPolicyParser sharedFolderJoinPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringAnyone {
    NSString *value = @"from_anyone";
    DropboxSharedFolderJoinPolicy expectedResult = DSFJPFromAnyone;
    
    DropboxSharedFolderJoinPolicy result = [DropboxSharedFolderJoinPolicyParser sharedFolderJoinPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringUnknown {
    NSString *value = @"asdfasdf";
    DropboxSharedFolderJoinPolicy expectedResult = DSFJPNotSet;
    
    DropboxSharedFolderJoinPolicy result = [DropboxSharedFolderJoinPolicyParser sharedFolderJoinPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testDictionary {
    NSString *value = @"from_team_only";
    DropboxSharedFolderJoinPolicy expectedResult = DSFJPFromTeamOnly;
    NSDictionary *dic = @{ @".tag": value };
    
    DropboxSharedFolderJoinPolicy result = [DropboxSharedFolderJoinPolicyParser sharedFolderJoinPolicyFromDictionary:dic];
    
    XCTAssertEqual(result, expectedResult);
}


@end
