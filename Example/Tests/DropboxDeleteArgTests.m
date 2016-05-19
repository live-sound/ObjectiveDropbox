//
//  DropboxDeleteArg.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxDeleteArg.h"

@interface DropboxDeleteArgTests : XCTestCase

@property (nonatomic) DropboxDeleteArg *arg;

@end

@implementation DropboxDeleteArgTests

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
    
    self.arg = [[DropboxDeleteArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.arg.path, path);
}


@end
