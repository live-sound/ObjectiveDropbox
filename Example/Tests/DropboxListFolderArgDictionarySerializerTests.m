//
//  DropboxListFolderArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 07.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderArg+DictionarySerializer.h"

@interface DropboxListFolderArgDictionarySerializerTests : XCTestCase

@property (nonatomic) DropboxListFolderArg *arg;

@end

@implementation DropboxListFolderArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *path = @"/";
    BOOL recursive = YES;
    BOOL includeMediaInfo = NO;
    BOOL includeDeleted = YES;
    BOOL includeHasExplicit = YES;
    self.arg = [[DropboxListFolderArg alloc] initWithPath:path recursive:recursive includeMediaInfo:includeMediaInfo includeDeleted:includeDeleted includeHasExplicitSharedMembers:includeHasExplicit];
    
    NSDictionary *dic = [self.arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{ @"path": self.arg.path, @"recursive": @(self.arg.recursive), @"include_media_info": @(self.arg.includeMediaInfo), @"include_deleted": @(self.arg.includeDeleted), @"include_has_explicit_shared_members": @(self.arg.includeHasExplicitSharedMembers) };
    XCTAssertEqualObjects(dic, expectedDic);
}

@end
