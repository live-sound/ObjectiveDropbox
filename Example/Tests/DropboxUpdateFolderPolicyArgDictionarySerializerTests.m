//
//  DropboxUpdateFolderPolicyArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUpdateFolderPolicyArg+DictionarySerializer.h"

@interface DropboxUpdateFolderPolicyArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxUpdateFolderPolicyArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *ID = @"a;sdf;asdkfj";
    DropboxMemberPolicy memberPolicy = DMPTeam;
    DropboxAclUpdatePolicy aclUpdatePolicy = DAUPOwner;
    DropboxSharedLinkPolicy sharedLinkPolicy = DSLPMembers;
    NSDictionary *expectedDic = @{ @"shared_folder_id": ID,
                                   @"member_policy": @"team",
                                   @"acl_update_policy": @"owner",
                                   @"shared_link_policy": @"members" };
    DropboxUpdateFolderPolicyArg *arg = [[DropboxUpdateFolderPolicyArg alloc] initWithSharedFolderID:ID memberPolicy:memberPolicy aclUpdatePolicy:aclUpdatePolicy sharedLinkPolicy:sharedLinkPolicy];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
