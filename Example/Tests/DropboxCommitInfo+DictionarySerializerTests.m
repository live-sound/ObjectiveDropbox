//
//  DropboxCommitInfo+DictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxCommitInfo+DictionarySerializer.h"

@interface DropboxCommitInfo_DictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxCommitInfo *arg;

@end

@implementation DropboxCommitInfo_DictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)test1 {
    NSDictionary *expectedDic = @{
                          @"path": @"/Homework/math/Matrices.txt",
                          @"mode": @"add",
                          @"autorename": @YES,
                          @"mute": @NO
                          };
    self.arg = [[DropboxCommitInfo alloc] initWithPath:@"/Homework/math/Matrices.txt" mode:[[DropboxWriteMode alloc] initWithMode:DWMAdd updateString:nil] autorename:YES clientModified:nil mute:NO];
    
    NSDictionary *result = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(result, expectedDic);
}

- (void)test2 {
    NSDictionary *expectedDic = @{
        @"path": @"/Homework/math/Matrices.txt",
        @"mode": @{
            @".tag": @"update",
            @"update": @"a1c10ce0dd78"
        },
        @"autorename": @NO,
        @"mute": @NO
    };
    self.arg = [[DropboxCommitInfo alloc] initWithPath:@"/Homework/math/Matrices.txt" mode:[[DropboxWriteMode alloc] initWithMode:DWMUpdate updateString:@"a1c10ce0dd78"] autorename:NO clientModified:nil mute:NO];
    
    NSDictionary *result = [self.arg dictionaryFromParams];
    
    XCTAssertEqualObjects(result, expectedDic);
}


@end
