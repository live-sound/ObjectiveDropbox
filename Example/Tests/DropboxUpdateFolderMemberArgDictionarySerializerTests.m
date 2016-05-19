//
//  DropboxUpdateFolderMemberArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUpdateFolderMemberArg+DictionarySerializer.h"

@interface DropboxUpdateFolderMemberArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxUpdateFolderMemberArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sharedFolderID = @"a;sdjf;alsjdfk";
    NSDictionary *expectedDic = @{
                                  @"shared_folder_id": sharedFolderID,
                                  @"member": @{
                                      @".tag": @"email",
                                      @"email": @"justin@example.com"
                                  },
                                  @"access_level": @"editor"
                                  };
    DropboxUpdateFolderMemberArg *arg = [[DropboxUpdateFolderMemberArg alloc] initWithSharedFolderID:sharedFolderID member:[DropboxMemberSelector new] accessLevel:DALEditor];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic[@"shared_folder_id"], expectedDic[@"shared_folder_id"]);
    XCTAssertNotNil(dic[@"member"]);
    XCTAssertNotNil(dic[@"access_level"]);
}


@end
