//
//  DropboxSharedFolderMembersDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedFolderMembers+DictionaryParser.h"

@interface DropboxSharedFolderMembersDictionaryParserTests : XCTestCase

@property DropboxSharedFolderMembers *result;

@end

@implementation DropboxSharedFolderMembersDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *cursor = @"ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu";
    NSDictionary *dic = @{
                          @"users": @[
                                  @{
                                      @"access_type": @{
                                              @".tag": @"owner"
                                              },
                                      @"user": @{
                                              @"account_id": @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc",
                                              @"same_team": @YES,
                                              @"team_member_id": @"dbmid:abcd1234"
                                              },
                                      @"permissions": @[],
                                      @"is_inherited": @YES
                                      }
                                  ],
                          @"groups": @[
                                  @{
                                      @"access_type": @{
                                              @".tag": @"editor"
                                              },
                                      @"group": @{
                                              @"group_name": @"Test group",
                                              @"group_id": @"g:e2db7665347abcd600000000001a2b3c",
                                              @"group_type": @{
                                                      @".tag": @"user_managed"
                                                      },
                                              @"same_team": @YES,
                                              @"member_count": @10
                                              },
                                      @"permissions": @[],
                                      @"is_inherited": @YES
                                      }
                                  ],
                          @"invitees": @[
                                  @{
                                      @"access_type": @{
                                              @".tag": @"viewer"
                                              },
                                      @"invitee": @{
                                              @".tag": @"email",
                                              @"email": @"jessica@example.com"
                                              },
                                      @"permissions": @[],
                                      @"is_inherited": @NO
                                      }
                                  ],
                          @"cursor": cursor
                          };
    
    self.result = [[DropboxSharedFolderMembers alloc] initWithDictionary:dic];
    
    XCTAssertNotNil(self.result.users);
    XCTAssertNotNil(self.result.groups);
    XCTAssertNotNil(self.result.invitees);
    XCTAssertEqualObjects(self.result.cursor, cursor);
}


@end
