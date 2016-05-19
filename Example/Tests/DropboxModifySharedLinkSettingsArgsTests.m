//
//  DropboxModifySharedLinkSettingsArgsTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxModifySharedLinkSettingsArgs.h"

@interface DropboxModifySharedLinkSettingsArgsTests : XCTestCase

@property DropboxModifySharedLinkSettingsArgs *arg;

@end

@implementation DropboxModifySharedLinkSettingsArgsTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    NSString *url = @"a;sldfa;lsdfjk";
    DropboxSharedLinkSettings *settings = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:DRVTeamOnly linkPassword:@"a;lsdkjf;asd" expires:nil];
    BOOL removeExpiration = YES;
    
    self.arg = [[DropboxModifySharedLinkSettingsArgs alloc] initWithURL:url settings:settings removeExpiration:removeExpiration];
    
    XCTAssertEqualObjects(self.arg.url, url);
    XCTAssertEqualObjects(self.arg.settings, settings);
    XCTAssertEqual(self.arg.removeExpiration, removeExpiration);
}

- (void)testShortInit {
    NSString *url = @"a;sldfa;lsdfjk";
    DropboxSharedLinkSettings *settings = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:DRVTeamOnly linkPassword:@"a;lsdkjf;asd" expires:nil];
    BOOL removeExpiration = NO;
    
    self.arg = [[DropboxModifySharedLinkSettingsArgs alloc] initWithURL:url settings:settings];
    
    XCTAssertEqualObjects(self.arg.url, url);
    XCTAssertEqualObjects(self.arg.settings, settings);
    XCTAssertEqual(self.arg.removeExpiration, removeExpiration);
}


@end
