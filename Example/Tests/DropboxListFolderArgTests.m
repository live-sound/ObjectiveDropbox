//
//  DropboxListFolderArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderArg.h"

@interface DropboxListFolderArgTests : XCTestCase

@property (nonatomic) DropboxListFolderArg *arg;

@end

@implementation DropboxListFolderArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *path = @"asdf";
    BOOL recursive = YES;
    BOOL includeMediaInfo = NO;
    BOOL includeDeleted = YES;
    BOOL includeHasExplicitySharedMembers = YES;
    
    self.arg = [[DropboxListFolderArg alloc] initWithPath:path recursive:recursive includeMediaInfo:includeMediaInfo includeDeleted:includeDeleted includeHasExplicitSharedMembers:includeHasExplicitySharedMembers];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.recursive, recursive);
    XCTAssertEqual(self.arg.includeMediaInfo, includeMediaInfo);
    XCTAssertEqual(self.arg.includeDeleted, includeDeleted);
    XCTAssertEqual(self.arg.includeHasExplicitSharedMembers, includeHasExplicitySharedMembers);
}

- (void)testShortInit {
    NSString *path = @"adsf asdf ";
    BOOL recursive = NO;
    BOOL includeMediaInfo = NO;
    BOOL includeDeleted = NO;
    BOOL includeHasExplicitySharedMembers = NO;
    
    self.arg = [[DropboxListFolderArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.recursive, recursive);
    XCTAssertEqual(self.arg.includeMediaInfo, includeMediaInfo);
    XCTAssertEqual(self.arg.includeDeleted, includeDeleted);
    XCTAssertEqual(self.arg.includeHasExplicitSharedMembers, includeHasExplicitySharedMembers);
}


@end
