//
//  DropboxListSharedLinksArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListSharedLinksArg+DictionarySerializer.h"

@interface DropboxListSharedLinksArgDictionarySerializerTests : XCTestCase

@property DropboxListSharedLinksArg *arg;

@end

@implementation DropboxListSharedLinksArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPath {
    NSString *path = @"a;lsdf;laskdfj";
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:path];
    NSDictionary *expectedDic = @{ @"path": path };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testPathAndDirectOnly {
    NSString *path = @"a;lsdf;laskdfj";
    BOOL directOnly = YES;
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:path cursor:nil directOnly:directOnly];
    NSDictionary *expectedDic = @{ @"path": path,
                                   @"direct_only": @(directOnly)};
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testCursor {
    NSString *cursor = @"a;lsdf;laskdfj";
    self.arg = [[DropboxListSharedLinksArg alloc] initWithPath:nil cursor:cursor];
    NSDictionary *expectedDic = @{ @"cursor": cursor };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
