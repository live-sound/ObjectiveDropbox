//
//  DropboxRestoreArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 20.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRestoreArg+DictionarySerializer.h"

@interface DropboxRestoreArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxRestoreArg *arg;

@end

@implementation DropboxRestoreArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"alsfjsald";
    NSString *rev = @"alsdfasd";
    NSDictionary *expectedDic = @{@"path": path, @"rev": rev};
    self.arg = [[DropboxRestoreArg alloc] initWithPath:path rev:rev];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic[@"path"], expectedDic[@"path"]);
    XCTAssertEqualObjects(dic[@"rev"], expectedDic[@"rev"]);
}


@end
