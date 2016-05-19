//
//  DropboxUploadSessionAppendArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionAppendArg.h"

@interface DropboxUploadSessionAppendArgTests : XCTestCase

@property (nonatomic) DropboxUploadSessionAppendArg *arg;

@end

@implementation DropboxUploadSessionAppendArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    DropboxUploadSessionCursor *cursor = [[DropboxUploadSessionCursor alloc] initWithSessionID:@"a;dlsjf;ds" offset:33];
    BOOL close = YES;
    
    self.arg = [[DropboxUploadSessionAppendArg alloc] initWithCursor:cursor close:close];
    
    XCTAssertEqualObjects(self.arg.cursor, cursor);
    XCTAssertEqual(self.arg.close, close);
}


@end
