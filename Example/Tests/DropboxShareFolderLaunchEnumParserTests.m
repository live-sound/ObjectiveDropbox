//
//  DropboxShareFolderLaunchEnumParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxShareFolderLaunchEnumParser.h"

@interface DropboxShareFolderLaunchEnumParserTests : XCTestCase

@end

@implementation DropboxShareFolderLaunchEnumParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testComplete {
    NSString *value = @"complete";
    DropboxShareFolderLaunchEnum expectedResult = DSFLComplete;
    
    DropboxShareFolderLaunchEnum result = [DropboxShareFolderLaunchEnumParser enumFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testAsyncJobID {
    NSString *value = @"async_job_id";
    DropboxShareFolderLaunchEnum expectedResult = DSFLAsyncJobID;
    
    DropboxShareFolderLaunchEnum result = [DropboxShareFolderLaunchEnumParser enumFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testUnknown {
    NSString *value = @"asfasdf";
    DropboxShareFolderLaunchEnum expectedResult = DSFLNotSet;
    
    DropboxShareFolderLaunchEnum result = [DropboxShareFolderLaunchEnumParser enumFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}


@end
