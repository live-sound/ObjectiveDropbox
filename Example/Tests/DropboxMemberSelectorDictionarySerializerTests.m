//
//  DropboxMemberSelectorDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxMemberSelector+DictionarySerializer.h"

@interface DropboxMemberSelectorDictionarySerializerTests : XCTestCase

@property DropboxMemberSelector *dms;

@end

@implementation DropboxMemberSelectorDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmail {
    NSString *value = @"a;sldjf;asdfj";
    self.dms = [[DropboxMemberSelector alloc] initWithEmail:value];
    
    NSDictionary *dic = [self.dms dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @".tag": @"email",
                                   @"email": value };
    XCTAssertEqualObjects(dic, expectedDic);
}

- (void)testDropboxID {
    NSString *value = @"a;sldjf;asdfj";
    self.dms = [[DropboxMemberSelector alloc] initWithDropboxID:value];
    
    NSDictionary *dic = [self.dms dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @".tag": @"dropbox_id",
                                   @"dropbox_id": value };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
