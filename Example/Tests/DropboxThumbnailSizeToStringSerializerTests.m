//
//  DropboxThumbnailSizeToStringSerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxThumbnailSizeToStringSerializer.h"

@interface DropboxThumbnailSizeToStringSerializerTests : XCTestCase

@end

@implementation DropboxThumbnailSizeToStringSerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test32 {
    DropboxThumbnailSize size = w32h32;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertEqualObjects(result, @"w32h32");
}

- (void)test64 {
    DropboxThumbnailSize size = w64h64;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertEqualObjects(result, @"w64h64");
}

- (void)test128 {
    DropboxThumbnailSize size = w128h128;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertEqualObjects(result, @"w128h128");
}

- (void)test640 {
    DropboxThumbnailSize size = w640h480;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertEqualObjects(result, @"w640h480");
}

- (void)test1024 {
    DropboxThumbnailSize size = w1024h768;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertEqualObjects(result, @"w1024h768");
}

- (void)testUnknownSize {
    DropboxThumbnailSize size = 100500;
    
    NSString *result = [DropboxThumbnailSizeToStringSerializer stringFromEnum:size];
    
    XCTAssertNil(result);
}



@end
