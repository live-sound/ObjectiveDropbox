//
//  DropboxJobStatusResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxJobStatusResult+DictionaryParser.h"

@interface DropboxJobStatusResultDictionaryParserTests : XCTestCase

@property DropboxJobStatusResult *result;

@end

@implementation DropboxJobStatusResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryInProgress {
    NSDictionary *dic = @{ @".tag": @"in_progress" };
    
    self.result = [[DropboxJobStatusResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.status, inProgress);
    XCTAssertNil(self.result.errorSummary);
}

- (void)testDictionaryComplete {
    NSDictionary *dic = @{ @".tag": @"complete" };
    
    self.result = [[DropboxJobStatusResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.status, complete);
    XCTAssertNil(self.result.errorSummary);
}

- (void)testDictionaryFailed {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"failed"};
    
    self.result = [[DropboxJobStatusResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.status, failed);
    XCTAssertNotNil(self.result.errorSummary);
}

- (void)testErrorSummaryWithUnshareFolderErrorWithAccessError {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"unshare_folder_error",
                           @"unshare_folder_error": @"access_error",
                           @"access_error": @"invalid_id"};
    
    NSString *errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    
    NSString *expectedSummary = @"unshare_folder_error/access_error/invalid_id";
    XCTAssertEqualObjects(errorSummary, expectedSummary);
}

- (void)testErrorSummaryWithUnshareFolderErrorWithTeamFolder {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"unshare_folder_error",
                           @"unshare_folder_error": @"team_folder"
                           };
    
    NSString *errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    
    NSString *expectedSummary = @"unshare_folder_error/team_folder";
    XCTAssertEqualObjects(errorSummary, expectedSummary);
}

- (void)testErrorSummaryWithRemoveFolderMemberErrorWithAccessError {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"remove_folder_member_error",
                           @"remove_folder_member_error": @"access_error",
                           @"access_error": @"invalid_id"};
    
    NSString *errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    
    NSString *expectedSummary = @"remove_folder_member_error/access_error/invalid_id";
    XCTAssertEqualObjects(errorSummary, expectedSummary);
}

- (void)testErrorSummaryWithRemoveFolderMemberErrorWithMemberError {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"remove_folder_member_error",
                           @"remove_folder_member_error": @"member_error",
                           @"member_error": @"invalid_dropbox_id"};
    
    NSString *errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    
    NSString *expectedSummary = @"remove_folder_member_error/member_error/invalid_dropbox_id";
    XCTAssertEqualObjects(errorSummary, expectedSummary);
}

- (void)testErrorSummaryWithRemoveFolderMemberErrorWitFolderOwner {
    NSDictionary *dic = @{ @".tag": @"failed",
                           @"failed": @"remove_folder_member_error",
                           @"remove_folder_member_error": @"folder_owner"                           };
    
    NSString *errorSummary = [DropboxJobStatusResult errorSummaryFromDictionary:dic];
    
    NSString *expectedSummary = @"remove_folder_member_error/folder_owner";
    XCTAssertEqualObjects(errorSummary, expectedSummary);
}

@end
