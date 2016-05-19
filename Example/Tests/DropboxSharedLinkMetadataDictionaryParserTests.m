//
//  DropboxSharedLinkMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkMetadata+DictionaryParser.h"

@interface DropboxSharedLinkMetadataDictionaryParserTests : XCTestCase

@property DropboxSharedLinkMetadata *meta;

@end

@implementation DropboxSharedLinkMetadataDictionaryParserTests

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
                          @".tag": @"folder",
                          @"url": @"https://www.dropbox.com/sh/s6fvw6ol7rmqo1x/AAAgWRSbjmYDvPpDB30Sykjfa?dl=0",
                          @"name": @"Math",
                          @"link_permissions": @{
                                  @"can_revoke": @NO,
                                  @"resolved_visibility": @{
                                          @".tag": @"public"
                                          },
                                  @"revoke_failure_reason": @{
                                          @".tag": @"owner_only"
                                          }
                                  },
                          @"id": @"id:a4ayc_80_OEAAAAAAAAAXw",
                          @"path_lower": @"/homework/math",
                          @"team_member_info": @{
                                  @"team_info": @{
                                          @"id": @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                                          @"name": @"Acme, Inc."
                                          },
                                  @"display_name": @"Roger Rabbit",
                                  @"member_id": @"dbmid:abcd1234"
                                  }
                          };
    
    self.meta = [[DropboxSharedLinkMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.meta.url, @"https://www.dropbox.com/sh/s6fvw6ol7rmqo1x/AAAgWRSbjmYDvPpDB30Sykjfa?dl=0");
    XCTAssertEqualObjects(self.meta.name, @"Math");
    XCTAssertEqual(self.meta.linkPermissions.canRevoke, NO);
    XCTAssertEqualObjects(self.meta.ID, @"id:a4ayc_80_OEAAAAAAAAAXw");
    XCTAssertNil(self.meta.expires);
    XCTAssertEqualObjects(self.meta.pathLower, @"/homework/math");
    XCTAssertNotNil(self.meta.teamMemberInfo);
}


@end
