//
//  DropboxShareFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxShareFolderArg+DictionarySerializer.h"

@interface DropboxShareFolderArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxShareFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/example/workspace";
    BOOL forceAsync = NO;
    NSDictionary *expectedDic = @{
                              @"path": path,
                              @"member_policy": @"team",
                              @"acl_update_policy": @"editors",
                              @"shared_link_policy": @"members",
                              @"force_async": @(forceAsync)
                          };
    DropboxShareFolderArg *arg = [[DropboxShareFolderArg alloc] initWithPath:path memberPolicy:DMPTeam aclUpdatePolicy:DAUPEditors sharedLinkPolicy:DSLPMembers forceAsync:forceAsync];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}

@end
