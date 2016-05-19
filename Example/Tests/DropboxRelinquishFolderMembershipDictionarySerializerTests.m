//
//  DropboxRelinquishFolderMembershipDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRelinquishFolderMembershipArg+DictionarySerializer.h"

@interface DropboxRelinquishFolderMembershipDictionarySerializerTests : XCTestCase

@property DropboxRelinquishFolderMembershipArg *arg;

@end

@implementation DropboxRelinquishFolderMembershipDictionarySerializerTests

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
    self.arg = [[DropboxRelinquishFolderMembershipArg alloc] initWithSharedFolderID:ID];
    NSDictionary *expectedDic = @{ @"shared_folder_id": ID };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testDictionaryWithBadString {
    self.arg = [[DropboxRelinquishFolderMembershipArg alloc] init];
    NSDictionary *expectedDic = @{ @"shared_folder_id": @"" };
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
