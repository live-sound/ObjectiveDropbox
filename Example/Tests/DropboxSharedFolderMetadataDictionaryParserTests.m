//
//  DropboxSharedFolderMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedFolderMetadata+DictionaryParser.h"

@interface DropboxSharedFolderMetadataDictionaryParserTests : XCTestCase

@property DropboxSharedFolderMetadata *sut;

@end

@implementation DropboxSharedFolderMetadataDictionaryParserTests

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
    NSDate *date = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier: NSCalendarIdentifierGregorian];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDateComponents *components = [gregorian components: NSUIntegerMax fromDate: date];
    [components setHour:0];
    [components setMinute:0];
    [components setSecond:0];
    [components setYear:2016];
    [components setMonth:1];
    [components setDay:20];
    NSDate *expectedDate = [gregorian dateFromComponents: components];
    
    self.sut = [[DropboxSharedFolderMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.sut.accessType, DALOwner);
    XCTAssertEqual(self.sut.isTeamFolder, NO);
    XCTAssertEqual(self.sut.policy.aclUpdatePolicy, DAUPOwner);
    XCTAssertEqual(self.sut.policy.sharedLinkPolicy, DSLPAnyone);
    XCTAssertEqual(self.sut.policy.memberPolicy, DMPAnyone);
    XCTAssertEqual(self.sut.policy.resolvedMemberPolicy, DMPTeam);
    XCTAssertEqualObjects(self.sut.name, @"dir");
    XCTAssertEqualObjects(self.sut.sharedFolderID, @"84528192421");
    XCTAssertTrue([self.sut.timeInvited compare:expectedDate]);
    XCTAssertEqualObjects(self.sut.pathLower, @"/dir");
    XCTAssertEqual(self.sut.permissions.count, 0);
}


@end
