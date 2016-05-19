//
//  DropboxTeamMemberInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTeamMemberInfo+DictionaryParser.h"

@interface DropboxTeamMemberInfoDictionaryParserTests : XCTestCase

@property DropboxTeamMemberInfo *info;

@end

@implementation DropboxTeamMemberInfoDictionaryParserTests

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
                          @"team_info": @{
                              @"id": @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                              @"name": @"Acme, Inc."
                          },
                          @"display_name": @"Roger Rabbit",
                          @"member_id": @"dbmid:abcd1234"
                          };
    self.info = [[DropboxTeamMemberInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.info.teamInfo.ID, @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I");
    XCTAssertEqualObjects(self.info.teamInfo.name, @"Acme, Inc.");
    XCTAssertEqualObjects(self.info.displayName, @"Roger Rabbit");
    XCTAssertEqualObjects(self.info.memberID, @"dbmid:abcd1234");
}


@end
