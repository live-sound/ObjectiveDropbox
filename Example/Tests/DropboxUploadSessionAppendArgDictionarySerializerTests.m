//
//  DropboxUploadSessionAppendArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionAppendArg+DictionarySerializer.h"

@interface DropboxUploadSessionAppendArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxUploadSessionAppendArg *arg;

@end

@implementation DropboxUploadSessionAppendArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sessionID = @";alksdjf;lasdfjk";
    UInt64 offset = 3;
    BOOL close = NO;
    DropboxUploadSessionCursor *c = [[DropboxUploadSessionCursor alloc] initWithSessionID:sessionID offset:offset];
    self.arg = [[DropboxUploadSessionAppendArg alloc] initWithCursor:c close:close];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"cursor": @{
                                      @"session_id": sessionID,
                                      @"offset": @(offset)
                                  },
                                  @"close": @(close)
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
