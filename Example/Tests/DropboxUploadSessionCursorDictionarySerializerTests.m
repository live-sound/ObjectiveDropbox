//
//  DropboxUploadSessionCursorDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionCursor+DictionarySerializer.h"

@interface DropboxUploadSessionCursorDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxUploadSessionCursor *cursor;

@end

@implementation DropboxUploadSessionCursorDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sessionID = @"1234faaf0678bcde";
    unsigned int offset = 989;
    self.cursor = [[DropboxUploadSessionCursor alloc] initWithSessionID:sessionID offset:offset];
    
    NSDictionary *dic = [self.cursor dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"session_id": sessionID,
                                  @"offset": @(offset)
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
