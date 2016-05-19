//
//  DropboxGetMetadataArgsDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetMetadataArgs+DictionarySerializer.h"

@interface DropboxGetMetadataArgsDictionarySerializerTests : XCTestCase

@property DropboxGetMetadataArgs *arg;

@end

@implementation DropboxGetMetadataArgsDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sharedFolderID = @"84528192421";
    self.arg = [[DropboxGetMetadataArgs alloc] initWithSharedFolderID:sharedFolderID];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"shared_folder_id": @"84528192421",
                                  @"actions": @[]
                                 };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
