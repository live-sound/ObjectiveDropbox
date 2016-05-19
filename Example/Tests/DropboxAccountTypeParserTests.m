//
//  DropboxAccountTypeParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAccountTypeParser.h"

@interface DropboxAccountTypeParserTests : XCTestCase

@end

@implementation DropboxAccountTypeParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringWithBasic
{
    NSString *value = @"basic";
    DropboxAccountType expectedResult = DATBasic;
    
    DropboxAccountType result = [DropboxAccountTypeParser accountTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringWithPro
{
    NSString *value = @"pro";
    DropboxAccountType expectedResult = DATPro;
    
    DropboxAccountType result = [DropboxAccountTypeParser accountTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}
- (void)testStringWithBusiness
{
    NSString *value = @"business";
    DropboxAccountType expectedResult = DATBusiness;
    
    DropboxAccountType result = [DropboxAccountTypeParser accountTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testStringWithUnknown
{
    NSString *value = @"sadf";
    DropboxAccountType expectedResult = DATNotSet;
    
    DropboxAccountType result = [DropboxAccountTypeParser accountTypeFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testDictionary {
    NSString *value = @"business";
    NSDictionary *dic = @{@".tag": value };
    DropboxAccountType expectedResult = DATBusiness;
    
    DropboxAccountType result = [DropboxAccountTypeParser accountTypeFromDictionary:dic];
    
    XCTAssertEqual(result, expectedResult);
}


@end
