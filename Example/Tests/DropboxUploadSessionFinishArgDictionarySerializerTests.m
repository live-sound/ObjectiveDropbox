//
//  DropboxUploadSessionFinishArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxUploadSessionFinishArg+DictionarySerializer.h"

@interface DropboxUploadSessionFinishArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxUploadSessionFinishArg *arg;

@end

@implementation DropboxUploadSessionFinishArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sessionID = @"1234faaf0678bcde";
    unsigned int offset = 0;
    DropboxUploadSessionCursor *cursor = [[DropboxUploadSessionCursor alloc] initWithSessionID:sessionID offset:offset];
    
    NSString *path = @"/Homework/math/Matrices.txt";
    DropboxWriteMode *mode = [[DropboxWriteMode alloc] initWithMode:DWMUpdate updateString:@"a1c10ce0dd78"];
    BOOL autorename = NO;
    BOOL mute = NO;
    DropboxCommitInfo *info = [[DropboxCommitInfo alloc] initWithPath:path mode:mode autorename:autorename clientModified:nil mute:mute];
    
    self.arg = [[DropboxUploadSessionFinishArg alloc] initWithCursor:cursor commit:info];
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"cursor": @{
                                      @"session_id": sessionID,
                                      @"offset": @(offset)
                                  },
                                  @"commit": @{
                                      @"path": path,
                                      @"mode": @{
                                          @".tag": @"update",
                                          @"update": mode.updateString
                                      },
                                      @"autorename": @NO,
                                      @"mute": @NO
                                  }
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
