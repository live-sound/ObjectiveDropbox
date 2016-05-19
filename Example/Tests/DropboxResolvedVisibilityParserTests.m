//
//  DropboxResolvedVisibilityParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxResolvedVisibilityParser.h"

@interface DropboxResolvedVisibilityParserTests : XCTestCase

@property DropboxResolvedVisibility result;

@end

@implementation DropboxResolvedVisibilityParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *value = @"team_and_password";
    NSDictionary *dic = @{ @".tag": value };
    
    self.result = [DropboxResolvedVisibilityParser resolvedVisibilityFromDictionary:dic];
    
    XCTAssertEqual(self.result, DResolvedVisibilityTeamAndPassword);
}

- (void)testString {
    NSString *value = @"shared_folder_only";
    
    self.result = [DropboxResolvedVisibilityParser resolvedVisibilityFromString:value];
    
    XCTAssertEqual(self.result, DResolvedVisibilitySharedFolderOnly);
}


@end
