//
//  DropboxPollArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxPollArg+DictionarySerializer.h"

@interface DropboxPollArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxPollArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *ID = @"a;lskdjf;alsdf";
    DropboxPollArg *arg = [[DropboxPollArg alloc] initWithAsyncJobID:ID];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @"async_job_id": ID };
    XCTAssertEqualObjects(dic, expectedDic);    
}


@end
