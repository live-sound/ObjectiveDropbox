//
//  DropboxRequestedVisibilityParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRequestedVisibilityParser.h"

@interface DropboxRequestedVisibilityParserTests : XCTestCase

@property DropboxRequestedVisibility result;

@end

@implementation DropboxRequestedVisibilityParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *value = @"public";
    NSDictionary *dic = @{ @".tag": value };
    
    self.result = [DropboxRequestedVisibilityParser requestedVisibilityFromDictionary:dic];
    
    XCTAssertEqual(self.result, DRVPublic);
}

- (void)testString {
    NSString *value = @"team_only";
    
    self.result = [DropboxRequestedVisibilityParser requestedVisibilityFromString:value];
    
    XCTAssertEqual(self.result, DRVTeamOnly);
}



@end
