//
//  DropboxTeamSpaceAllocationDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTeamSpaceAllocation+DictionaryParser.h"

@interface DropboxTeamSpaceAllocationDictionaryParserTests : XCTestCase

@property DropboxTeamSpaceAllocation *result;

@end

@implementation DropboxTeamSpaceAllocationDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    UInt64 allocated = 12312323;
    UInt64 used = 523334;
    NSDictionary *dic = @{ @"allocated": @(allocated),
                           @"used": @(used) };
    
    self.result = [[DropboxTeamSpaceAllocation alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.allocated, allocated);
    XCTAssertEqual(self.result.used, used);
}

@end
