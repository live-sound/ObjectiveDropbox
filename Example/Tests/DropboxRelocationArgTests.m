//
//  DropboxRelocationArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxRelocationArg.h"

@interface DropboxRelocationArgTests : XCTestCase

@property (nonatomic) DropboxRelocationArg *arg;

@end

@implementation DropboxRelocationArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    NSString *fromPath = @"";
    NSString *toPath = @"";
    
    self.arg = [[DropboxRelocationArg alloc] initWithFromPath:fromPath toPath:toPath];
    
    XCTAssertEqualObjects(self.arg.fromPath, fromPath);
    XCTAssertEqualObjects(self.arg.toPath, toPath);
}

@end
