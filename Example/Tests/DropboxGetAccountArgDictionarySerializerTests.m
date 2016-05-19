//
//  DropboxGetAccountArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetAccountArg+DictionarySerializer.h"

@interface DropboxGetAccountArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxGetAccountArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *ID = @"a;sldkfj;aljsdfk";
    NSDictionary *expectedDic = @{ @"account_id": ID };
    DropboxGetAccountArg *arg = [[DropboxGetAccountArg alloc] initWithAccountID:ID];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
