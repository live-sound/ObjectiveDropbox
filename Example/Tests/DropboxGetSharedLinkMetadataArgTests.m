//
//  DropboxGetSharedLinkMetadataArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetSharedLinkMetadataArg.h"

@interface DropboxGetSharedLinkMetadataArgTests : XCTestCase

@property DropboxGetSharedLinkMetadataArg *arg;

@end

@implementation DropboxGetSharedLinkMetadataArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *url = @";aklsdf;lasdfj";
    NSString *path = @"a;lsdf;lksafj";
    NSString *password = @"a;sldkf;asldfj";
    
    self.arg = [[DropboxGetSharedLinkMetadataArg alloc] initWithUrl:url path:path linkPassword:password];
    
    XCTAssertEqualObjects(self.arg.url, url);
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.linkPassword, password);
}

- (void)testShortInit {
    NSString *url = @";aklsdf;lasdfj";
    
    self.arg = [[DropboxGetSharedLinkMetadataArg alloc] initWithUrl:url];
    
    XCTAssertEqualObjects(self.arg.url, url);
    XCTAssertNil(self.arg.path);
    XCTAssertNil(self.arg.linkPassword);
}


@end
