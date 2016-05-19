//
//  ObjectiveDropboxTests.m
//  ObjectiveDropboxTests
//
//  Created by Mikhail Motyzhenkov on 04/07/2016.
//  Copyright (c) 2016 Mikhail Motyzhenkov. All rights reserved.
//

@import XCTest;
#import "DropboxRoutes.h"
#import "DropboxClient.h"
#import <OCMock/OCMock.h>

@interface DropboxRoutesTests : XCTestCase

@property (nonatomic) DropboxRoutes *routes;

@end

@implementation DropboxRoutesTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInitWithPathAndDelegate
{
    NSString *path = @"adlsfjalsd";
    id delegate = OCMProtocolMock(@protocol(DropboxRoutesDelegate));
    
    self.routes = [[DropboxRoutes alloc] initWithPath:path andWithDelegate:delegate];
    
    XCTAssertEqualObjects(self.routes.path, path);
    XCTAssertEqualObjects(self.routes.delegate, delegate);
}

- (void)testInitWithPathDelegateAndHttpHelper
{    
    NSString *path = @"adlsfjalsd";
    
    self.routes = [[DropboxRoutes alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.routes.path, path);
    XCTAssertNil(self.routes.delegate);
}


@end

