//
//  DropboxListFoldersResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFoldersResult+DictionaryParser.h"

@interface DropboxListFoldersResultDictionaryParserTests : XCTestCase

@property DropboxListFoldersResult *result;

@end

@implementation DropboxListFoldersResultDictionaryParserTests

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
                          @"entries": @[
                                  @{
                                      @"access_type": @{
                                              @".tag": @"owner"
                                              },
                                      @"is_team_folder": @NO,
                                      @"policy": @{
                                              @"acl_update_policy": @{
                                                      @".tag": @"owner"
                                                      },
                                              @"shared_link_policy": @{
                                                      @".tag": @"anyone"
                                                      },
                                              @"member_policy": @{
                                                      @".tag": @"anyone"
                                                      },
                                              @"resolved_member_policy": @{
                                                      @".tag": @"team"
                                                      }
                                              },
                                      @"name": @"dir",
                                      @"shared_folder_id": @"84528192421",
                                      @"time_invited": @"2016-01-20T00:00:00Z",
                                      @"path_lower": @"/dir",
                                      @"permissions": @[]
                                      }
                                  ],
                          @"cursor": cursor
                          };
    
    self.result = [[DropboxListFoldersResult alloc] initWithDictionary:dic];
    
    XCTAssertNotNil(self.result.entries);
    XCTAssertEqual(self.result.entries.count, 1);
    XCTAssertEqualObjects(self.result.cursor, cursor);
}

@end
