//
//  DropboxInviteeInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxInviteeInfo+DictionaryParser.h"

@interface DropboxInviteeInfoDictionaryParserTests : XCTestCase

@property DropboxInviteeInfo *info;

@end

@implementation DropboxInviteeInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testEmail {
    NSString *email = @"a;slkfj;alsdfj";
    NSDictionary *dic = @{ @".tag": @"email",
                           @"email": email };
    
    self.info = [[DropboxInviteeInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.type, DIIEmail);
    XCTAssertEqualObjects(self.info.value, email);
}


@end
