//
//  DropboxCreateSharedLinkSettingsArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 24.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxCreateSharedLinkWithSettingsArg+DictionarySerializer.h"

@interface DropboxCreateSharedLinkSettingsArgDictionarySerializerTests : XCTestCase

@property DropboxCreateSharedLinkWithSettingsArg *arg;

@end

@implementation DropboxCreateSharedLinkSettingsArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/Prime_Numbers.txt";
    DropboxSharedLinkSettings *settings = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:DRVPublic linkPassword:nil expires:nil];
    self.arg = [[DropboxCreateSharedLinkWithSettingsArg alloc] initWithPath:path settings:settings];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];

    NSDictionary *expectedDic = @{
                                  @"path": @"/Prime_Numbers.txt",
                                  @"settings": @{
                                      @"requested_visibility": @"public"
                                  }
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
