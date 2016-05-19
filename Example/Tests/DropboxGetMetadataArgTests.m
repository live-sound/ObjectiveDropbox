//
//  DropboxGetMetadataArg.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetMetadataArg.h"

@interface DropboxGetMetadataArgTests : XCTestCase

@property (nonatomic) DropboxGetMetadataArg *arg;

@end

@implementation DropboxGetMetadataArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *path = @"";
    BOOL includeMediaInfo = NO;
    BOOL includeDeleted = YES;
    
    self.arg = [[DropboxGetMetadataArg alloc] initWithPath:path includeMediaInfo:includeMediaInfo includeDeleted:includeDeleted];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.includeMediaInfo, includeMediaInfo);
    XCTAssertEqual(self.arg.includeDeleted, includeDeleted);
}

@end
