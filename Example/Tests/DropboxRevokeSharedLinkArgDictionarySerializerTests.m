//
//  DropboxRevokeSharedLinkArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRevokeSharedLinkArg+DictionarySerializer.h"

@interface DropboxRevokeSharedLinkArgDictionarySerializerTests : XCTestCase

@property DropboxRevokeSharedLinkArg *arg;

@end

@implementation DropboxRevokeSharedLinkArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *url = @"a;lksdjf;alsdfjk";
    NSDictionary *expectedDic = @{ @"url": url };
    self.arg = [[DropboxRevokeSharedLinkArg alloc] initWithURL:url];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
