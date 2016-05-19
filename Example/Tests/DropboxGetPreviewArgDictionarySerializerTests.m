//
//  DropboxGetPreviewArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetPreviewArg+DictionarySerializer.h"

@interface DropboxGetPreviewArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxGetPreviewArg *arg;

@end

@implementation DropboxGetPreviewArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/";
    
    self.arg = [[DropboxGetPreviewArg alloc] initWithPath:path];
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{@"path" : path};
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
