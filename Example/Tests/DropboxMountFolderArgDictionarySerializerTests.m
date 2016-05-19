//
//  DropboxMountFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMountFolderArg+DictionarySerializer.h"

@interface DropboxMountFolderArgDictionarySerializerTests : XCTestCase

@property DropboxMountFolderArg *arg;

@end

@implementation DropboxMountFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithGoodString {
    NSString *ID = @"a;sdfa;lsdfjk";
    self.arg = [[DropboxMountFolderArg alloc] initWithSharedFolderID:ID];
    NSDictionary *expectedDic = @{ @"shared_folder_id": ID };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testDictionaryWithBadString {
    self.arg = [[DropboxMountFolderArg alloc] init];
    NSDictionary *expectedDic = @{ @"shared_folder_id": @"" };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
