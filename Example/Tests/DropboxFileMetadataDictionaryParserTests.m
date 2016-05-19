//
//  DropboxFileMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 08.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFileMetadata+DictionaryParser.h"

@interface DropboxFileMetadataDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxFileMetadata *meta;

@end

@implementation DropboxFileMetadataDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary
{
    NSString *clientModified = @"2015-05-12T15:50:38Z";
    NSString *serverModified = @"2015-05-12T15:50:39Z";
    NSString *revision = @"aaa";
    unsigned int size = 7123;
    NSString *ID = @"a;dlsfjasldf";
    NSString *name = @"a;sdlfja;lsdfk";
    NSString *pathLower = @"alasdf;alsdfk";
    NSString *pathDisplay = @"a ;la f;alsd ;";
    
    NSDictionary *sharingInfo = @{
            @"read_only": @YES,
            @"parent_shared_folder_id": @"84528192421",
            @"modified_by": @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
        };
    
    NSDictionary *dic = @{@"client_modified": clientModified, @"server_modified": serverModified, @"rev": revision, @"size": @(size), @"id": ID, @"sharing_info": sharingInfo, @"name": name, @"path_lower": pathLower, @"path_display": pathDisplay};
    self.meta = [[DropboxFileMetadata alloc] initWithDictionary:dic];
    
    XCTAssertNotNil(self.meta.clientModified);
    XCTAssertNotNil(self.meta.serverModified);
    
    XCTAssertNotNil(self.meta.sharingInfo);
    XCTAssertNil(self.meta.mediaInfo);
    
    XCTAssertEqualObjects(self.meta.rev, revision);
    XCTAssertEqual(self.meta.size, size);
    XCTAssertEqualObjects(self.meta.id, ID);
}

- (void)testBadDictionary
{
    NSString *clientModified = @"";
    NSString *serverModified = @"";
    int size = -1;
    id ID = [NSNull null];
    
    NSDictionary *dic = @{@"client_modified": clientModified, @"server_modified": serverModified, @"size": @(size), @"id": ID};
    
    XCTAssertNoThrow(self.meta = [[DropboxFileMetadata alloc] initWithDictionary:dic]);
    XCTAssertNil(self.meta.mediaInfo);
    XCTAssertNil(self.meta.sharingInfo);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.meta = [[DropboxFileMetadata alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.meta.mediaInfo);
    XCTAssertNil(self.meta.sharingInfo);
}


@end
