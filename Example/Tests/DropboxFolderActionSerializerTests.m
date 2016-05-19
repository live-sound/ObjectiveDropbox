//
//  DropboxFolderActionSerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFolderActionSerializer.h"

@interface DropboxFolderActionSerializerTests : XCTestCase

@end

@implementation DropboxFolderActionSerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringChangeOptions {
    DropboxFolderAction action = DFAChangeOptions;
    NSString *expectedString = @"change_options";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringEditContents {
    DropboxFolderAction action = DFAEditContents;
    NSString *expectedString = @"edit_contents";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringInviteEditor {
    DropboxFolderAction action = DFAInviteEditor;
    NSString *expectedString = @"invite_editor";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringInviteViewer {
    DropboxFolderAction action = DFAInviteViewer;
    NSString *expectedString = @"invite_viewer";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringRelinquishMembership {
    DropboxFolderAction action = DFARelinquishMembership;
    NSString *expectedString = @"relinquish_membership";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringUnmount {
    DropboxFolderAction action = DFAUnmount;
    NSString *expectedString = @"unmount";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringUnshare {
    DropboxFolderAction action = DFAUnshare;
    NSString *expectedString = @"unshare";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testStringLeaveACopy {
    DropboxFolderAction action = DFALeaveACopy;
    NSString *expectedString = @"leave_a_copy";
    
    NSString *string = [DropboxFolderActionSerializer stringFromEnum:action];
    
    XCTAssertEqualObjects(string, expectedString);
}

- (void)testDictionary {
    DropboxFolderAction action = DFAChangeOptions;
    NSString *expectedString = @"change_options";
    NSDictionary *expectedDic = @{ @".tag": expectedString };
    
    NSDictionary *dic = [DropboxFolderActionSerializer dictionaryFromFolderAction:action];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
