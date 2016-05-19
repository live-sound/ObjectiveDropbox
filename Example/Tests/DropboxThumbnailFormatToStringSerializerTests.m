//
//  DropboxThumbnailFormatToStringSerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxThumbnailFormatToStringSerializer.h"

@interface DropboxThumbnailFormatToStringSerializerTests : XCTestCase

@end

@implementation DropboxThumbnailFormatToStringSerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testJPEG {
    DropboxThumbnailFormat format = JPEG;
    
    NSString *result = [DropboxThumbnailFormatToStringSerializer stringFromEnum:format];
    
    XCTAssertEqualObjects(result, @"jpeg");
}

- (void)testPNG {
    DropboxThumbnailFormat format = PNG;
    
    NSString *result = [DropboxThumbnailFormatToStringSerializer stringFromEnum:format];
    
    XCTAssertEqualObjects(result, @"png");
}

- (void)testUnknownFormat {
    DropboxThumbnailFormat format = 100500;
    
    NSString *result = [DropboxThumbnailFormatToStringSerializer stringFromEnum:format];
    
    XCTAssertNil(result);
}


@end
