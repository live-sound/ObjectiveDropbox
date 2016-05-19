//
//  DropboxGroupTypeParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGroupTypeParser.h"

@interface DropboxGroupTypeParserTests : XCTestCase

@end

@implementation DropboxGroupTypeParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTeam {
    NSString *value = @"team";
    DropboxGroupType expectedResult = DGTTeam;
    
    DropboxGroupType result = [DropboxGroupTypeParser groupTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testUserManaged {
    NSString *value = @"user_managed";
    DropboxGroupType expectedResult = DGTUserManaged;
    
    DropboxGroupType result = [DropboxGroupTypeParser groupTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testUnknown {
    NSString *value = @"asdfasdf";
    DropboxGroupType expectedResult = DGTNotSet;
    
    DropboxGroupType result = [DropboxGroupTypeParser groupTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testDictionary {
    NSString *value = @"team";
    NSDictionary *dic = @{ @".tag": value };
    DropboxGroupType expectedResult = DGTTeam;
    
    DropboxGroupType result = [DropboxGroupTypeParser groupTypeFromDictinary:dic];
    
    XCTAssertEqual(result, expectedResult);
}

@end
