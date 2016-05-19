//
//  DropboxUploadSessionStartResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionStartResult+DictionaryParser.h"

@interface DropboxUploadSessionStartResultDictionaryParserTests : XCTestCase

@property DropboxUploadSessionStartResult *result;

@end

@implementation DropboxUploadSessionStartResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *sessionID = @"a;sdlkfjas;dl";
    NSDictionary *dic = @{ @"session_id": sessionID };
    
    self.result = [[DropboxUploadSessionStartResult alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.sessionID, sessionID);
}


- (void)testDictionaryWithBadValue {
    NSNumber *sessionID = @33;
    NSDictionary *dic = @{ @"session_id": sessionID };
    
    self.result = [[DropboxUploadSessionStartResult alloc] initWithDictionary:dic];
    
    XCTAssertNil(self.result.sessionID);
}

- (void)testDictionaryWithBadKey {
    NSString *sessionID = @"a;sdlkfjas;dl";
    NSDictionary *dic = @{ @"session_iddd": sessionID };
    
    self.result = [[DropboxUploadSessionStartResult alloc] initWithDictionary:dic];
    
    XCTAssertNil(self.result.sessionID);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{  };
    
    self.result = [[DropboxUploadSessionStartResult alloc] initWithDictionary:dic];
    
    XCTAssertNil(self.result.sessionID);
}


@end
