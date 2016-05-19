//
//  DropboxTransferFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTransferFolderArg+DictionarySerializer.h"

@interface DropboxTransferFolderArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxTransferFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sharedFolderID = @"a;lsdkjf;aslkdfj";
    NSString *toDropboxID = @"a;lsdkf;alskdfj";
    NSDictionary *expectedDic = @{ @"shared_folder_id": sharedFolderID,
                                   @"to_dropbox_id": toDropboxID };
    DropboxTransferFolderArg *arg = [[DropboxTransferFolderArg alloc] initWithSharedFolderID:sharedFolderID toDropboxID:toDropboxID];
    
    NSDictionary *dic = [arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
