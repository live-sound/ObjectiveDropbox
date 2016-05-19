//
//  DropboxNameDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxName+DictionaryParser.h"

@interface DropboxNameDictionaryParserTests : XCTestCase

@property DropboxName *sut;

@end

@implementation DropboxNameDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *givenName = @"a;sdkjf;alsdjkf";
    NSString *surname = @"a;sdkjfalsdjkf";
    NSString *familiarName = @"adkjf;alsdjkf";
    NSString *displayName = @"a;;alsdjkf";
    NSDictionary *dic = @{ @"given_name": givenName,
                           @"surname": surname,
                           @"familiar_name": familiarName,
                           @"display_name": displayName
                         };
    
    self.sut = [[DropboxName alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.sut.givenName, givenName);
    XCTAssertEqualObjects(self.sut.surname, surname);
    XCTAssertEqualObjects(self.sut.familiarName, familiarName);
    XCTAssertEqualObjects(self.sut.displayName, displayName);
}


@end
