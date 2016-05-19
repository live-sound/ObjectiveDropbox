//
//  DropboxTeamSharingPoliciesDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTeamSharingPolicies+DictionaryParser.h"

@interface DropboxTeamSharingPoliciesDictionaryParserTests : XCTestCase

@property DropboxTeamSharingPolicies *result;

@end

@implementation DropboxTeamSharingPoliciesDictionaryParserTests

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
                          @"shared_folder_member_policy": @{
                              @".tag": @"team"
                          },
                          @"shared_folder_join_policy": @{
                              @".tag": @"from_anyone"
                          },
                          @"shared_link_create_policy": @{
                              @".tag": @"team_only"
                          }
                          };
    self.result = [[DropboxTeamSharingPolicies alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.sharedFolderMemberPolicy, DSFMPTeam);
    XCTAssertEqual(self.result.sharedFolderJoinPolicy, DSFJPFromAnyone);
    XCTAssertEqual(self.result.sharedLinkCreatePolicy, DSLCPTeamOnly);
}


@end
