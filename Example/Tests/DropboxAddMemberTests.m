//
//  DropboxAddMemberTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAddMember.h"

@interface DropboxAddMemberTests : XCTestCase

@property DropboxAddMember *arg;

@end

@implementation DropboxAddMemberTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    DropboxMemberSelector *dms = [[DropboxMemberSelector alloc] initWithEmail:@"asdl;fasjdf"];
    DropboxAccessLevel al = DALEditor;
    
    self.arg = [[DropboxAddMember alloc] initWithMember:dms accessLevel:al];
    
    XCTAssertEqualObjects(self.arg.member, dms);
    XCTAssertEqual(self.arg.accessLevel, al);
}


@end
