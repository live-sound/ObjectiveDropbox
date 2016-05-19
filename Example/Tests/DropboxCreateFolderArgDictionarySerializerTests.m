//
//  DropboxCreateFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxCreateFolderArg+DictionarySerializer.h"

@interface DropboxCreateFolderArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxCreateFolderArg *arg;

@end

@implementation DropboxCreateFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"";
    
    self.arg = [[DropboxCreateFolderArg alloc] initWithPath:path];
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{@"path": self.arg.path};
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
