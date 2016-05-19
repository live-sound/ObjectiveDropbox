//
//  DropboxCreateSharedLinkWithSettingsArgTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxCreateSharedLinkWithSettingsArg.h"

@interface DropboxCreateSharedLinkWithSettingsArgTests : XCTestCase

@property DropboxCreateSharedLinkWithSettingsArg *sut;

@end

@implementation DropboxCreateSharedLinkWithSettingsArgTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFullInit {
    DropboxSharedLinkSettings *sls = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:DRVPublic linkPassword:@"a;lsdjfl;" expires:nil];
    NSString *path = @"al;sdjf;lasdfjk";
    
    self.sut = [[DropboxCreateSharedLinkWithSettingsArg alloc] initWithPath:path settings:sls];
    
    XCTAssertEqualObjects(self.sut.path, path);
    XCTAssertEqualObjects(self.sut.settings, sls);
}

- (void)testShortInit {
    NSString *path = @"al;sdjf;lasdfjk";
    
    self.sut = [[DropboxCreateSharedLinkWithSettingsArg alloc] initWithPath:path];
    
    XCTAssertEqualObjects(self.sut.path, path);
    XCTAssertNil(self.sut.settings);
}


@end
