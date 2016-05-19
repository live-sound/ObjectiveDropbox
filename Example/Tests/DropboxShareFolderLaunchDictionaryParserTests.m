//
//  DropboxShareFolderLaunchDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxShareFolderLaunch+DictionaryParser.h"

@interface DropboxShareFolderLaunchDictionaryParserTests : XCTestCase

@property DropboxShareFolderLaunch *result;

@end

@implementation DropboxShareFolderLaunchDictionaryParserTests

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
                          @".tag": @"complete",
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
                          };
    
    self.result = [[DropboxShareFolderLaunch alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.type, DSFLComplete);
    XCTAssertNotNil(self.result.completeValue);
}


@end
