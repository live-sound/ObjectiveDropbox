//
//  DropboxUnshareFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUnshareFolderArg+DictionarySerializer.h"

@interface DropboxUnshareFolderArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxUnshareFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sharedFolderID = @"a;sldjf;alsdf";
    BOOL copy = YES;
    NSDictionary *expectedDic = @{ @"shared_folder_id": sharedFolderID,
                                   @"leave_a_copy": @(copy) };
    DropboxUnshareFolderArg *arg = [[DropboxUnshareFolderArg alloc] initWithSharedFolderID:sharedFolderID leaveACopy:copy];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
