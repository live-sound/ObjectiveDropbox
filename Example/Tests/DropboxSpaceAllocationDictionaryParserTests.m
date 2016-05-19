//
//  DropboxSpaceAllocationDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSpaceAllocation+DictionaryParser.h"

@interface DropboxSpaceAllocationDictionaryParserTests : XCTestCase

@property DropboxSpaceAllocation *result;

@end

@implementation DropboxSpaceAllocationDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSDictionary *dic = @{
                          @".tag": @"individual",
                          @"allocated": @10000000000
                          };
    
    self.result = [[DropboxSpaceAllocation alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.type, DSAIndividual);
    XCTAssertNotNil(self.result.valueIndividual);
    XCTAssertNil(self.result.valueTeam);
}


@end
