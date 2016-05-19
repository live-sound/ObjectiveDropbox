//
//  DropboxFileSharingInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 08.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFileSharingInfo+DictionaryParser.h"

@interface DropboxFileSharingInfoDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxFileSharingInfo *info;

@end

@implementation DropboxFileSharingInfoDictionaryParserTests

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
    NSString *parentSharedFolderID = @"a;sdlfjk";
    NSString *modifiedBy = @"a;ldsfjk;alsdfjk";
    NSDictionary *dic = @{@"read_only": @(readOnly), @"parent_shared_folder_id": parentSharedFolderID, @"modified_by": modifiedBy};
    
    self.info = [[DropboxFileSharingInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.info.modifiedBy, modifiedBy);
}

- (void)testBadDictionary {
    NSDictionary *dic = @{@"modifiedBy": [NSNull null]};
    
    XCTAssertNoThrow(self.info = [[DropboxFileSharingInfo alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.info.modifiedBy);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.info = [[DropboxFileSharingInfo alloc] initWithDictionary:dic]);
}

@end
