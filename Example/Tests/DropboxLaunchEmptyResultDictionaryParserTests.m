//
//  DropboxLaunchEmptyResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxLaunchEmptyResult+DictionaryParser.h"

@interface DropboxLaunchEmptyResultDictionaryParserTests : XCTestCase

@property DropboxLaunchEmptyResult *result;

@end

@implementation DropboxLaunchEmptyResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testComplete {
    NSDictionary *dic = @{
                          @".tag": @"complete"
                         };
    
    self.result = [[DropboxLaunchEmptyResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.type, DLERComplete);
}

- (void)testAsyncJobID {
    NSString *value = @"34g93hh34h04y384084";
    NSDictionary *dic = @{
                          @".tag": @"async_job_id",
                          @"async_job_id": value
                          };
    
    self.result = [[DropboxLaunchEmptyResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.type, DLERAsyncJobID);
    XCTAssertEqualObjects(self.result.value, value);
}


@end
