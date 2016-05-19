//
//  DropboxFolderPolicyDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFolderPolicy+DictionaryParser.h"

@interface DropboxFolderPolicyDictionaryParserTests : XCTestCase

@property DropboxFolderPolicy *sut;

@end

@implementation DropboxFolderPolicyDictionaryParserTests

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
                          };
    
    self.sut = [[DropboxFolderPolicy alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.sut.aclUpdatePolicy, DAUPOwner);
    XCTAssertEqual(self.sut.sharedLinkPolicy, DSLPAnyone);
    XCTAssertEqual(self.sut.memberPolicy, DMPAnyone);
    XCTAssertEqual(self.sut.resolvedMemberPolicy, DMPTeam);
}


@end
