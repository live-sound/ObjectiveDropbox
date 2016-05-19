//
//  DropboxFullTeamDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFullTeam+DictionaryParser.h"

@interface DropboxFullTeamDictionaryParserTests : XCTestCase

@property DropboxFullTeam *result;

@end

@implementation DropboxFullTeamDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *ID = @"a;sldjfl;asdfj";
    NSString *name = @"a;lsdjf;lasdf";
    NSDictionary *dic = @{
                          @"id": ID,
                          @"name": name,
                          @"sharing_policies": @{
                              @"shared_folder_member_policy": @{
                                  @".tag": @"team"
                              },
                              @"shared_folder_join_policy": @{
                                  @".tag": @"from_anyone"
                              },
                              @"shared_link_create_policy": @{
                                  @".tag": @"team_only"
                              }
                          }
                          };
    
    self.result = [[DropboxFullTeam alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.ID, ID);
    XCTAssertEqualObjects(self.result.name, name);
    XCTAssertNotNil(self.result.sharingPolicies);
}


@end
