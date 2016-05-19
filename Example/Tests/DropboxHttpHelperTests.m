//
//  DropboxHttpHelperTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 14.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxHttpHelper+PrivateMethods.h"
#import <OCMock/OCMock.h>
#import "DropboxErrors.h"

@interface DropboxHttpHelperTests : XCTestCase

@property (nonatomic) DropboxHttpHelper *http;

@end

@implementation DropboxHttpHelperTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUrlWithHostPathMethod {
    NSString *host = @"aasdfasdf";
    NSString *path = @"a;sldfas";
    NSString *method = @"as;dlfjas;ldfj";
    
    NSURL *url = [DropboxHttpHelper urlWithHost:host path:path method:method];
    
    NSString *expectedUrlString = [NSString stringWithFormat:@"%@/%@/%@", host, path, method];
    XCTAssertEqualObjects([url absoluteString], expectedUrlString);
}

- (void)testHandleDropboxRequestErrorWithBadInputParam {
    XCTestExpectation *expectErrorMessage = [self expectationWithDescription:@"expect error message"];
    int statusCode = 400;
    NSString *errorMessage = @"a;lkdfsja;lsdjf;lasjk";
    NSDictionary *bodyDic = @{ @"error_summary": errorMessage };
    NSData *outputContent = [NSJSONSerialization dataWithJSONObject:bodyDic options:NSJSONWritingPrettyPrinted error:nil];    
    
    [DropboxHttpHelper handleDropboxRequestErrorWithStatusCode:statusCode outputContent:outputContent outputHeadersDic:nil errorBlock:^(DropboxError * _Nonnull error) {
        XCTAssertTrue([error.errorSummary containsString:errorMessage]);
        [expectErrorMessage fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:1 handler:^(NSError * _Nullable error) {
        if (error)
        {
            XCTFail(@"fail");
        }
    }];
}

- (void)testJsonStringFromDictionary
{
    NSDictionary *dic = @{
                          @"path": @"/Homework/math/Matrices.txt",
                          @"mode": @"add",
                          @"autorename": @YES,
                          @"mute": @NO
                          };
    NSString *expectedString = @"{\"path\": \"/Homework/math/Matrices.txt\",\"mode\": \"add\",\"autorename\": true,\"mute\": false}";
    NSDictionary *expectedDic = [NSJSONSerialization JSONObjectWithData:[expectedString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    NSString *string = [DropboxHttpHelper jsonStringWithDictionary:dic];
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:[string dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
    
    XCTAssertEqualObjects(resultDic, expectedDic);
}


@end
