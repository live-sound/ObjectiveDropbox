//
//  DropboxMemberSelectorTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberSelector.h"

@interface DropboxMemberSelectorTests : XCTestCase

@property (nonatomic) DropboxMemberSelector *arg;

@end

@implementation DropboxMemberSelectorTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithEmail {
    NSString *email = @"a;slkdjfa;sldfj";
    
    self.arg = [[DropboxMemberSelector alloc] initWithEmail:email];
    
    XCTAssertEqual(self.arg.type, DMSEmail);
    XCTAssertEqualObjects(self.arg.value, email);
}

- (void)testInitWithDropboxID {
    NSString *dropboxID = @"a;;sldfj";
    
    self.arg = [[DropboxMemberSelector alloc] initWithDropboxID:dropboxID];
    
    XCTAssertEqual(self.arg.type, DMSDropboxID);
    XCTAssertEqualObjects(self.arg.value, dropboxID);
}


@end
