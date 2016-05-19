//
//  DropboxFolderPermissionDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFolderPermission+DictionaryParser.h"

@interface DropboxFolderPermissionDictionaryParserTests : XCTestCase

@property DropboxFolderPermission *sut;

@end

@implementation DropboxFolderPermissionDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSDictionary *dic = @{ @"action": @"edit_contents",
                           @"allow": @YES,
                           @"reason": @"user_not_allowed_by_owner"
                           };
    
    self.sut = [[DropboxFolderPermission alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.sut.action, DFAEditContents);
    XCTAssertEqual(self.sut.allow, YES);
    XCTAssertEqual(self.sut.reason, DPDRUserNotAllowedByOwner);
}


@end
