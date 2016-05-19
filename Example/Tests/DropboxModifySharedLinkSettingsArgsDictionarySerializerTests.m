//
//  DropboxModifySharedLinkSettingsArgsDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 26.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxModifySharedLinkSettingsArgs+DictionarySerializer.h"
#import "DropboxSharedLinkSettings+DictionarySerializer.h"

@interface DropboxModifySharedLinkSettingsArgsDictionarySerializerTests : XCTestCase

@property DropboxModifySharedLinkSettingsArgs *arg;

@end

@implementation DropboxModifySharedLinkSettingsArgsDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *url = @"https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0";
    DropboxSharedLinkSettings *settings = [[DropboxSharedLinkSettings alloc] initWithRequestedVisibility:DRVPublic linkPassword:nil expires:nil];
    BOOL removeExpiration = NO;
    NSDictionary *expectedDic = @{ @"url": url,
                                   @"settings": [settings dictionaryFromParams],
                                   @"remove_expiration": @(removeExpiration) };
    self.arg = [[DropboxModifySharedLinkSettingsArgs alloc] initWithURL:url settings:settings removeExpiration:removeExpiration];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
