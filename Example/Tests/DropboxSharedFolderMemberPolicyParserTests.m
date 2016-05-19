//
//  DropboxSharedFolderMemberPolicyParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedFolderMemberPolicyParser.h"

@interface DropboxSharedFolderMemberPolicyParserTests : XCTestCase

@end

@implementation DropboxSharedFolderMemberPolicyParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringTeam {
    NSString *value = @"team";
    DropboxSharedFolderMemberPolicy expectedResult = DSFMPTeam;
    
    DropboxSharedFolderMemberPolicy result = [DropboxSharedFolderMemberPolicyParser sharedFolderMemberPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringAnyone {
    NSString *value = @"anyone";
    DropboxSharedFolderMemberPolicy expectedResult = DSFMPAnyone;
    
    DropboxSharedFolderMemberPolicy result = [DropboxSharedFolderMemberPolicyParser sharedFolderMemberPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringUnknown {
    NSString *value = @"asdfasdf";
    DropboxSharedFolderMemberPolicy expectedResult = DSFMPNotSet;
    
    DropboxSharedFolderMemberPolicy result = [DropboxSharedFolderMemberPolicyParser sharedFolderMemberPolicyFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testDictionary {
    NSString *value = @"team";
    DropboxSharedFolderMemberPolicy expectedResult = DSFMPTeam;
    NSDictionary *dic = @{ @".tag": value };
    
    DropboxSharedFolderMemberPolicy result = [DropboxSharedFolderMemberPolicyParser sharedFolderMemberPolicyFromDictionary:dic];
    
    XCTAssertEqual(result, expectedResult);
}


@end
