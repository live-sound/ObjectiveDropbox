//
//  DropboxWriteModeDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxWriteMode+DictionarySerializer.h"

@interface DropboxWriteModeDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxWriteMode *arg;

@end

@implementation DropboxWriteModeDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithUpdate {
    DropboxWriteModeEnum mode = DWMUpdate;
    NSString *updateString = @"a1c10ce0dd78";
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:updateString];
    
    NSDictionary *dic = [self.arg dictionaryOrStringFromParams];
    
    NSDictionary *expectedDictionary = @{
            @".tag": @"update",
            @"update": updateString
        };
    XCTAssertEqualObjects(dic, expectedDictionary);
}

- (void)testDictionaryWithAdd {
    DropboxWriteModeEnum mode = DWMAdd;
    NSString *updateString = @"a1c10ce0dd78";
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:updateString];
    
    NSString *result = [self.arg dictionaryOrStringFromParams];
    
    NSString *expectedString = @"add";
    XCTAssertEqualObjects(result, expectedString);
}

- (void)testDictionaryWithOverwrite {
    DropboxWriteModeEnum mode = DWMOverwrite;
    NSString *updateString = @"a1c10ce0dd78";
    self.arg = [[DropboxWriteMode alloc] initWithMode:mode updateString:updateString];
    
    NSString *result = [self.arg dictionaryOrStringFromParams];
    
    NSString *expectedString = @"overwrite";
    XCTAssertEqualObjects(result, expectedString);
}


@end
