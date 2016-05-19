//
//  DropboxRemoveFolderMemberArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRemoveFolderMemberArg+DictionarySerializer.h"

@interface DropboxRemoveFolderMemberArgDictionarySerializerTests : XCTestCase

@property DropboxRemoveFolderMemberArg *arg;

@end

@implementation DropboxRemoveFolderMemberArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *ID = @"84528192421";
    NSString *email = @"justin@example.com";
    BOOL copy = NO;
    NSDictionary *expectedDic = @{
                          @"shared_folder_id": ID,
                          @"member": @{
                              @".tag": @"email",
                              @"email": email
                          },
                          @"leave_a_copy": @(copy)
                          };
    self.arg = [[DropboxRemoveFolderMemberArg alloc] initWithSharedFolderID:ID member:[[DropboxMemberSelector alloc] initWithEmail:email] leaveACopy:copy];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
