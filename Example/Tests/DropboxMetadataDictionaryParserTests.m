//
//  DropboxMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMetadata+DictionaryParser.h"

@interface DropboxMetadataDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxMetadata *meta;

@end

@implementation DropboxMetadataDictionaryParserTests

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
    NSString *name = @"a;sdlfja;lsdfk";
    NSString *pathLower = @"alasdf;alsdfk";
    NSString *pathDisplay = @"a ;la f;alsd ;";
    
    NSDictionary *dic = @{@"name": name, @"path_lower": pathLower, @"path_display": pathDisplay};
    self.meta = [[DropboxMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.meta.pathLower, pathLower);
    XCTAssertEqualObjects(self.meta.pathDisplay, pathDisplay);
    XCTAssertEqualObjects(self.meta.name, name);
}

- (void)testBadDictionary
{
    id nul = [NSNull null];
    
    NSDictionary *dic = @{@"name": nul};
    
    XCTAssertNoThrow(self.meta = [[DropboxMetadata alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.meta.name);
    XCTAssertNil(self.meta.pathLower);
    XCTAssertNil(self.meta.pathDisplay);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.meta = [[DropboxMetadata alloc] initWithDictionary:dic]);
    
    XCTAssertNil(self.meta.name);
    XCTAssertNil(self.meta.pathLower);
    XCTAssertNil(self.meta.pathDisplay);
}

@end
