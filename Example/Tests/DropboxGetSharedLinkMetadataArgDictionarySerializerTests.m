//
//  DropboxGetSharedLinkMetadataArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetSharedLinkMetadataArg+DictionarySerializer.h"

@interface DropboxGetSharedLinkMetadataArgDictionarySerializerTests : XCTestCase

@property DropboxGetSharedLinkMetadataArg *arg;

@end

@implementation DropboxGetSharedLinkMetadataArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *url = @"a;sdf;alsdjf;la";
    NSString *path = @"a;lsdfj;alsdf;asdf;asl";
    self.arg = [[DropboxGetSharedLinkMetadataArg alloc] initWithUrl:url path:path linkPassword:nil];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @"url": url,
                                   @"path": path };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
