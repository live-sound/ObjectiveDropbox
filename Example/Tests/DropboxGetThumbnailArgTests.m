//
//  DropboxGetThumbnailArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxGetThumbnailArg.h"

@interface DropboxGetThumbnailArgTests : XCTestCase

@property (nonatomic) DropboxGetThumbnailArg *arg;

@end

@implementation DropboxGetThumbnailArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *path = @"";
    DropboxThumbnailFormat format = JPEG;
    DropboxThumbnailSize size = w128h128;
    
    self.arg = [[DropboxGetThumbnailArg alloc] initWithPath:path format:format size:size];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqual(self.arg.format, format);
    XCTAssertEqual(self.arg.size, size);
}


@end
