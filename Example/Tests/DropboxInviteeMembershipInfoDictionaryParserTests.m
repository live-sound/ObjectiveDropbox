//
//  DropboxInviteeMembershipInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxInviteeMembershipInfo+DictionaryParser.h"

@interface DropboxInviteeMembershipInfoDictionaryParserTests : XCTestCase

@property DropboxInviteeMembershipInfo *info;

@end

@implementation DropboxInviteeMembershipInfoDictionaryParserTests

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
                              @".tag": @"viewer"
                          },
                          @"invitee": @{
                              @".tag": @"email",
                              @"email": @"jessica@example.com"
                          },
                          @"permissions": @[],
                          @"is_inherited": @NO
                          };
    
    self.info = [[DropboxInviteeMembershipInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.info.accessType, DALViewer);
    XCTAssertNotNil(self.info.invitee);
    XCTAssertEqual(self.info.permissions.count, 0);
    XCTAssertEqual(self.info.isInherited, NO);
}


@end
