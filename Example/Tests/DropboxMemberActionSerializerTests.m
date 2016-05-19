//
//  DropboxMemberActionSerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberActionSerializer.h"

@interface DropboxMemberActionSerializerTests : XCTestCase

@end

@implementation DropboxMemberActionSerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMakeEditor {
    DropboxMemberAction action = DMAMakeEditor;
    NSString *expectedString = @"make_editor";
    
    NSString *result = [DropboxMemberActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(result, expectedString);
}

- (void)testMakeOwner {
    DropboxMemberAction action = DMAMakeOwner;
    NSString *expectedString = @"make_owner";
    
    NSString *result = [DropboxMemberActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(result, expectedString);
}

- (void)testMakeViewer {
    DropboxMemberAction action = DMAMakeViewer;
    NSString *expectedString = @"make_viewer";
    
    NSString *result = [DropboxMemberActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(result, expectedString);
}

- (void)testRemove {
    DropboxMemberAction action = DMARemove;
    NSString *expectedString = @"remove";
    
    NSString *result = [DropboxMemberActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(result, expectedString);
}

- (void)testUnknown {
    UInt64 action = 123123;
    
    NSString *result = [DropboxMemberActionSerializer stringFromEnum:action];
    
    XCTAssertNil(result);
}



@end
