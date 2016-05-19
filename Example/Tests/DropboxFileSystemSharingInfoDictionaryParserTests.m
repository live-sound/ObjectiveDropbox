//
//  DropboxFileSystemSharingInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFileSystemSharingInfo+DictionaryParser.h"

@interface DropboxFileSystemSharingInfoDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxFileSystemSharingInfo *info;

@end

@implementation DropboxFileSystemSharingInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    BOOL readOnly = YES;
    NSString *parentSharedFolderID = @"sdfsdf";
    NSDictionary *dic = @{@"parent_shared_folder_id": parentSharedFolderID, @"read_only": @(readOnly)};
    
    self.info = [[DropboxFileSystemSharingInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.readOnly, readOnly);
    XCTAssertEqualObjects(self.info.parentSharedFolderID, parentSharedFolderID);
}

- (void)testGoodDictionaryWithoutOptionalParams {
    BOOL readOnly = YES;
    NSDictionary *dic = @{@"read_only": @(readOnly)};
    
    self.info = [[DropboxFileSystemSharingInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.readOnly, readOnly);
    XCTAssertNil(self.info.parentSharedFolderID);
}

- (void)testBadDictionaryWithNull {
    id nul = [NSNull null];
    
    NSDictionary *dic = @{@"parent_shared_folder_id": nul, @"read_only": nul};
    
    XCTAssertNoThrow(self.info = [[DropboxFileSystemSharingInfo alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.info = [[DropboxFileSystemSharingInfo alloc] initWithDictionary:dic]);
}


@end
