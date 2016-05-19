//
//  DropboxSearchArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSearchArg+DictionarySerializer.h"
#import "DropboxSearchModeStringSerializer.h"

@interface DropboxSearchArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxSearchArg *arg;

@end

@implementation DropboxSearchArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"a;sdlkfjad;";
    NSString *query = @"a;sdfa;sldfj";
    UInt64 start = 33;
    UInt64 maxResults = 234;
    DropboxSearchMode mode = deletedFileName;
    
    self.arg = [[DropboxSearchArg alloc] initWithPath:path query:query start:start maxResults:maxResults mode:mode];
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{@"path": path,
                                  @"query": query,
                                  @"start": @(start),
                                  @"max_results": @(maxResults),
                                  @"mode": [DropboxSearchModeStringSerializer stringFromEnum:mode]};
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
