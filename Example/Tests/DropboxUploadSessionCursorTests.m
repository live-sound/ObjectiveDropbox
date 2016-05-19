//
//  DropboxUploadSessionCursorTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionCursor.h"

@interface DropboxUploadSessionCursorTests : XCTestCase

@property (nonatomic) DropboxUploadSessionCursor *arg;

@end

@implementation DropboxUploadSessionCursorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *sessionID = @"a;dlskfja;sldfjk";
    unsigned int offset = 234;
    
    self.arg = [[DropboxUploadSessionCursor alloc] initWithSessionID:sessionID offset:offset];
    
    XCTAssertEqualObjects(self.arg.sessionID, sessionID);
    XCTAssertEqual(self.arg.offset, offset);
}


@end
