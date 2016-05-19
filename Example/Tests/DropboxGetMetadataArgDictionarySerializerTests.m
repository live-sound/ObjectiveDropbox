//
//  DropboxGetMetadataArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetMetadataArg+DictionarySerializer.h"

@interface DropboxGetMetadataArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxGetMetadataArg *arg;

@end

@implementation DropboxGetMetadataArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/";
    BOOL includeMediaInfo = YES;
    BOOL includeDeleted = NO;
    
    self.arg = [[DropboxGetMetadataArg alloc] initWithPath:path includeMediaInfo:includeMediaInfo includeDeleted:includeDeleted];
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{@"path" : path, @"include_media_info" : @(includeMediaInfo), @"include_deleted" : @(includeDeleted)};
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
