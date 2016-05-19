//
//  DropboxUserInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUserInfo+DictionaryParser.h"

@interface DropboxUserInfoDictionaryParserTests : XCTestCase

@property DropboxUserInfo *info;

@end

@implementation DropboxUserInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *account = @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc";
    BOOL sameTeam = YES;
    NSString *teamMemberID = @"dbmid:abcd1234";
    
    NSDictionary *dic = @{
            @"account_id": account,
            @"same_team": @(sameTeam),
            @"team_member_id": teamMemberID
        };
    
    self.info = [[DropboxUserInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.info.accountID, account);
    XCTAssertEqualObjects(self.info.teamMemberID, teamMemberID);
    XCTAssertEqual(self.info.sameTeam, sameTeam);
}


@end
