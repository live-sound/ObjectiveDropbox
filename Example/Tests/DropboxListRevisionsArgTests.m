//
//  DropboxListRevisionsArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListRevisionsArg.h"

@interface DropboxListRevisionsArgTests : XCTestCase

@property (nonatomic) DropboxListRevisionsArg *arg;

@end

@implementation DropboxListRevisionsArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit
{
    NSString *path = @"";
    UInt64 limit = 11;
    
    self.arg = [[DropboxListRevisionsArg alloc] initWithPath:path limit:limit];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.limit, limit);
}


@end
