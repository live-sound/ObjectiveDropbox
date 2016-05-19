//
//  DropboxMemberActionParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberActionParser.h"

@interface DropboxMemberActionParserTests : XCTestCase

@end

@implementation DropboxMemberActionParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testMakeEditor {
    NSString *value = @"make_editor";
    DropboxMemberAction expectedResult = DMAMakeEditor;
    
    DropboxMemberAction result = [DropboxMemberActionParser memberActionFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testMakeOwner {
    NSString *value = @"make_owner";
    DropboxMemberAction expectedResult = DMAMakeOwner;
    
    DropboxMemberAction result = [DropboxMemberActionParser memberActionFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testMakeViewer {
    NSString *value = @"make_viewer";
    DropboxMemberAction expectedResult = DMAMakeViewer;
    
    DropboxMemberAction result = [DropboxMemberActionParser memberActionFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testRemove {
    NSString *value = @"remove";
    DropboxMemberAction expectedResult = DMARemove;
    
    DropboxMemberAction result = [DropboxMemberActionParser memberActionFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}

- (void)testUnknown {
    NSString *value = @"asdfasdf";
    DropboxMemberAction expectedResult = DMANotSet;
    
    DropboxMemberAction result = [DropboxMemberActionParser memberActionFromString:value];
    
    XCTAssertEqual(result, expectedResult);
}


@end
