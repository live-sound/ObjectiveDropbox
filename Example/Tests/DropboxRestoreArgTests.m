//
//  DropboxRestoreArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 20.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRestoreArg.h"

@interface DropboxRestoreArgTests : XCTestCase

@property (nonatomic) DropboxRestoreArg *arg;

@end

@implementation DropboxRestoreArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *rev = @"fasdfasd";
    NSString *path = @"vs adsf ";
    
    self.arg = [[DropboxRestoreArg alloc] initWithPath:path rev:rev];
    
    XCTAssertEqualObjects(self.arg.path, path);
    XCTAssertEqualObjects(self.arg.rev, rev);
}


@end
