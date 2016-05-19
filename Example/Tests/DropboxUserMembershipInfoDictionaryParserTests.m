//
//  DropboxUserMembershipInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUserMembershipInfo+DictionaryParser.h"

@interface DropboxUserMembershipInfoDictionaryParserTests : XCTestCase

@property DropboxUserMembershipInfo *info;

@end

@implementation DropboxUserMembershipInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSDictionary *dic = @{
                          @"access_type": @{
                              @".tag": @"owner"
                          },
                          @"user": @{
                              @"account_id": @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc",
                              @"same_team": @YES,
                              @"team_member_id": @"dbmid:abcd1234"
                          },
                          @"permissions": @[],
                          @"is_inherited": @NO
                          };
    self.info = [[DropboxUserMembershipInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.accessType, DALOwner);
    XCTAssertNotNil(self.info.user);
    XCTAssertEqual(self.info.permissions.count, 0);
    XCTAssertEqual(self.info.isInherited, NO);
}


@end
