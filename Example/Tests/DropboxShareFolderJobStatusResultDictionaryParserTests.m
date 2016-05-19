//
//  DropboxShareFolderJobStatusResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 23.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxShareFolderJobStatusResult+DictionaryParser.h"

@interface DropboxShareFolderJobStatusResultDictionaryParserTests : XCTestCase

@property DropboxShareFolderJobStatusResult *result;

@end


@implementation DropboxShareFolderJobStatusResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testComplete {
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
    
    self.result = [[DropboxShareFolderJobStatusResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.status, DSFJSComplete);
    XCTAssertEqual(self.result.metadata.accessType, DALOwner);
    XCTAssertEqual(self.result.metadata.isTeamFolder, NO);
    XCTAssertEqual(self.result.metadata.policy.aclUpdatePolicy, DAUPOwner);
    XCTAssertEqual(self.result.metadata.policy.sharedLinkPolicy, DSLPAnyone);
    XCTAssertEqual(self.result.metadata.policy.memberPolicy, DMPAnyone);
    XCTAssertEqual(self.result.metadata.policy.resolvedMemberPolicy, DMPTeam);
    XCTAssertEqualObjects(self.result.metadata.name, @"dir");
    XCTAssertEqualObjects(self.result.metadata.sharedFolderID, @"84528192421");
    XCTAssertTrue([self.result.metadata.timeInvited compare:expectedDate]);
    XCTAssertEqualObjects(self.result.metadata.pathLower, @"/dir");
    XCTAssertEqual(self.result.metadata.permissions.count, 0);
}

- (void)testInProgress
{
    NSDictionary *dic = @{ @".tag": @"in_progress" };
    
    self.result = [[DropboxShareFolderJobStatusResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.status, DSFJSInProgress);
}


@end
