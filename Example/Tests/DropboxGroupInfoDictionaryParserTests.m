//
//  DropboxGroupInfoDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGroupInfo+DictionaryParser.h"

@interface DropboxGroupInfoDictionaryParserTests : XCTestCase

@property DropboxGroupInfo *info;

@end

@implementation DropboxGroupInfoDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *name = @"Test group";
    NSString *ID = @"g:e2db7665347abcd600000000001a2b3c";
    BOOL sameTeam = YES;
    int count = 10;
    DropboxGroupType groupType = DGTUserManaged;
    NSDictionary *dic = @{
                          @"group_name": name,
                          @"group_id": ID,
                          @"group_type": @{
                              @".tag": @"user_managed"
                          },
                          @"same_team": @(sameTeam),
                          @"member_count": @(count)
                          };
    
    self.info = [[DropboxGroupInfo alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.info.groupName, name);
    XCTAssertEqualObjects(self.info.groupID, ID);
    XCTAssertEqual(self.info.groupType, groupType);
    XCTAssertEqual(self.info.sameTeam, sameTeam);
    XCTAssertNil(self.info.groupExternalID);
    XCTAssertEqual(self.info.memberCount, count);
}


@end
