//
//  DropboxSpaceUsageDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSpaceUsage+DictionaryParser.h"

@interface DropboxSpaceUsageDictionaryParserTests : XCTestCase

@property DropboxSpaceUsage *result;

@end

@implementation DropboxSpaceUsageDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    UInt64 used = 234234;
    NSDictionary *dic = @{
                          @"used": @(used),
                          @"allocation": @{
                              @".tag": @"individual",
                              @"allocated": @10000000000
                          }
                          };
    
    self.result = [[DropboxSpaceUsage alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.used, used);
    XCTAssertNotNil(self.result.allocation);
    XCTAssertEqual(self.result.allocation.type, DSAIndividual);
    XCTAssertEqual(self.result.allocation.valueIndividual.allocated, 10000000000);
}


@end
