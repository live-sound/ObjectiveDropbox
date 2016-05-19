//
//  DropboxFolderMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 08.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFolderMetadata+DictionaryParser.h"

@interface DropboxFolderMetadataDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxFolderMetadata *meta;

@end

@implementation DropboxFolderMetadataDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *ID = @"a;ldjfasl;dfjk";
    NSString *name = @"a;sdjfa;sldjk|;";
    NSString *pathLower = @"a;dslkfj;alsdf; as";
    NSString *pathDisplay = @"a;sdfj ;alsdj a;sdf a;sldf";
    NSDictionary *sharingInfo = @{
            @"read_only": @NO,
            @"parent_shared_folder_id": @"84528192421"
        };
    
    NSDictionary *dic = @{@"id": ID, @"name": name, @"path_lower": pathLower, @"path_display": pathDisplay, @"sharing_info": sharingInfo};
    
    self.meta = [[DropboxFolderMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.meta.id, ID);    
    XCTAssertNotNil(self.meta.sharingInfo);
}

- (void)testBadDictionary {
    id nul = [NSNull null];
    NSDictionary *dic = @{@"id": nul};
    
    XCTAssertNoThrow(self.meta = [[DropboxFolderMetadata alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.meta.id);
    XCTAssertNil(self.meta.sharingInfo);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.meta = [[DropboxFolderMetadata alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.meta.id);
    XCTAssertNil(self.meta.sharingInfo);
}


@end
