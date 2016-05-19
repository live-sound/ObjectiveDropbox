//
//  DropboxGroupMembershipInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGroupMembershipInfo+DictionaryParser.h"

@interface DropboxGroupMembershipInfoDictionaryParserTests : XCTestCase

@property DropboxGroupMembershipInfo *info;

@end

@implementation DropboxGroupMembershipInfoDictionaryParserTests

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
                          @"is_inherited": @NO
                          };
    self.info = [[DropboxGroupMembershipInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.accessType, DALOwner);
    XCTAssertNotNil(self.info.group);
    XCTAssertEqual(self.info.permissions.count, 0);
    XCTAssertEqual(self.info.isInherited, NO);
}


@end
