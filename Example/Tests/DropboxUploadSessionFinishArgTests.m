//
//  DropboxUploadSessionFinishArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionFinishArg.h"

@interface DropboxUploadSessionFinishArgTests : XCTestCase

@property (nonatomic) DropboxUploadSessionFinishArg *arg;

@end

@implementation DropboxUploadSessionFinishArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    DropboxUploadSessionCursor *c = [[DropboxUploadSessionCursor alloc] initWithSessionID:@"1234faaf0678bcde" offset:0];
    DropboxCommitInfo *com = [[DropboxCommitInfo alloc] initWithPath:@"/Homework/math/Matrices.txt" mode:[[DropboxWriteMode alloc] initWithMode:DWMAdd updateString:nil] autorename:YES clientModified:nil mute:NO];
    
    self.arg = [[DropboxUploadSessionFinishArg alloc] initWithCursor:c commit:com];
    
    XCTAssertEqualObjects(self.arg.cursor, c);
    XCTAssertEqualObjects(self.arg.commit, com);
}


@end
