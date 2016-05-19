//
//  DropboxFolderSharingInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFolderSharingInfo+DictionaryParser.h"

@interface DropboxFolderSharingInfoDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxFolderSharingInfo *info;

@end

@implementation DropboxFolderSharingInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *sharedFolderID = @"adfasdf|;";
    BOOL readOnly = YES;
    NSString *parentSharedFolderID = @"sdfsdf";
    NSDictionary *dic = @{@"shared_folder_id": sharedFolderID, @"parent_shared_folder_id": parentSharedFolderID, @"read_only": @(readOnly)};
    
    self.info = [[DropboxFolderSharingInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.info.sharedFolderID, sharedFolderID);
}

- (void)testGoodDictionaryWithoutOptionalParams {
    BOOL readOnly = YES;
    
    NSDictionary *dic = @{@"read_only": @(readOnly)};
    
    self.info = [[DropboxFolderSharingInfo alloc] initWithDictionary:dic];
    
    XCTAssertNil(self.info.sharedFolderID);
}

- (void)testBadDictionaryWithNull {
    id nul = [NSNull null];
    
    NSDictionary *dic = @{@"shared_folder_id": nul, @"parent_shared_folder_id": nul, @"read_only": nul};
    
    XCTAssertNoThrow(self.info = [[DropboxFolderSharingInfo alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.info = [[DropboxFolderSharingInfo alloc] initWithDictionary:dic]);
}


@end
