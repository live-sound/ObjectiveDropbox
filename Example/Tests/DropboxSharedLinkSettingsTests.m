//
//  DropboxSharedLinkSettingsTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkSettings.h"

@interface DropboxSharedLinkSettingsTests : XCTestCase

@property DropboxSharedLinkSettings *sut;

@end

@implementation DropboxSharedLinkSettingsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testInit {
    DropboxRequestedVisibility visibility = DRVTeamOnly;
    NSString *linkPassword = @"a;lsdjkf;";
    NSDate *date = [NSDate new];
    
    self.sut = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:visibility linkPassword:linkPassword expires:date];
    
    XCTAssertEqual(self.sut.requestedVisibility, visibility);
    XCTAssertEqualObjects(self.sut.linkPassword, linkPassword);
    XCTAssertEqualObjects(self.sut.expires, date);
}


@end
