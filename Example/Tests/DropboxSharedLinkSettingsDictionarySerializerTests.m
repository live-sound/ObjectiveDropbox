//
//  DropboxSharedLinkSettingsDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkSettings+DictionarySerializer.h"
#import "NSDate+DateToDropboxString.h"

@interface DropboxSharedLinkSettingsDictionarySerializerTests : XCTestCase

@property DropboxSharedLinkSettings *settings;

@end

@implementation DropboxSharedLinkSettingsDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    DropboxRequestedVisibility visibility = DRVPassword;
    NSString *linkPassword = @"a;ldskjf;ladksf";
    NSDate *expires = [NSDate date];
    
    self.settings = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:visibility linkPassword:linkPassword expires:expires];
    NSDictionary *dic = [self.settings dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @"requested_visibility": @"password",
                                   @"link_password": linkPassword,
                                   @"expires": [expires dropboxDate]
                                 };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
