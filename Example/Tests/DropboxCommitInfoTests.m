//
//  DropboxCommitInfoTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxCommitInfo.h"

@interface DropboxCommitInfoTests : XCTestCase

@property (nonatomic) DropboxCommitInfo *arg;

@end

@implementation DropboxCommitInfoTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *path = @"a;lsdjf;as;";
    DropboxWriteMode *mode = [[DropboxWriteMode alloc] initWithMode:DWMAdd updateString:nil];
    BOOL autorename = YES;
    NSDate *clientModified = [NSDate date];
    BOOL mute = YES;
    
    self.arg = [[DropboxCommitInfo alloc] initWithPath:path mode:mode autorename:autorename clientModified:clientModified mute:mute];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.mode, mode);
    XCTAssertEqual(self.arg.autorename, autorename);
    XCTAssertEqualObjects(self.arg.clientModified, clientModified);
    XCTAssertEqual(self.arg.mute, mute);
}

- (void)testShortInit
{
    NSString *path = @"a;lsdjf;as;";
    DropboxWriteMode *mode = [[DropboxWriteMode alloc] initWithMode:DWMAdd updateString:nil];
    BOOL autorename = NO;
    NSDate *clientModified = nil;
    BOOL mute = NO;
    
    self.arg = [[DropboxCommitInfo alloc] initWithPath:path mode:mode];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.mode, mode);
    XCTAssertEqual(self.arg.autorename, autorename);
    XCTAssertEqualObjects(self.arg.clientModified, clientModified);
    XCTAssertEqual(self.arg.mute, mute);
}


@end
