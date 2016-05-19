//
//  DropboxGetAccountBatchArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetAccountBatchArg+DictionarySerializer.h"

@interface DropboxGetAccountBatchArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxGetAccountBatchArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSDictionary *expectedDic = @{
                                  @"account_ids": @[
                                                  @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc",
                                                  @"dbid:AAH1Vcz-DVoRDeixtr_OA8oUGgiqhs4XPOQ"
                                                  ]
                                  };
    DropboxGetAccountBatchArg *arg = [[DropboxGetAccountBatchArg alloc] initWithAccountIDs:@"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc", @"dbid:AAH1Vcz-DVoRDeixtr_OA8oUGgiqhs4XPOQ", nil];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
