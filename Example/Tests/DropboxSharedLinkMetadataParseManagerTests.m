//
//  DropboxSharedLinkMetadataParseManagerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 25.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSharedLinkMetadataParseManager.h"
#import "DropboxFileLinkMetadata.h"
#import "DropboxFolderLinkMetadata.h"

@interface DropboxSharedLinkMetadataParseManagerTests : XCTestCase

@end

@implementation DropboxSharedLinkMetadataParseManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFile {
    NSDictionary *dic = @{
                          @".tag": @"file",
                          @"url": @"https://www.dropbox.com/s/2sn712vy1ovegw8/Prime_Numbers.txt?dl=0",
                          @"name": @"Prime_Numbers.txt",
                          @"link_permissions": @{
                                  @"can_revoke": @NO,
                                  @"resolved_visibility": @{
                                          @".tag": @"public"
                                          },
                                  @"revoke_failure_reason": @{
                                          @".tag": @"owner_only"
                                          }
                                  },
                          @"client_modified": @"2015-05-12T15:50:38Z",
                          @"server_modified": @"2015-05-12T15:50:38Z",
                          @"rev": @"a1c10ce0dd78",
                          @"size": @7212,
                          @"id": @"id:a4ayc_80_OEAAAAAAAAAXw",
                          @"path_lower": @"/homework/math/prime_numbers.txt",
                          @"team_member_info": @{
                                  @"team_info": @{
                                          @"id": @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                                          @"name": @"Acme, Inc."
                                          },
                                  @"display_name": @"Roger Rabbit",
                                  @"member_id": @"dbmid:abcd1234"
                                  }
                          };

    DropboxSharedLinkMetadata *meta = [DropboxSharedLinkMetadataParseManager metadataWithDictionary:dic];
    
    XCTAssertTrue([meta isKindOfClass:[DropboxFileLinkMetadata class]]);
}

- (void)testFolder
{
    NSDictionary *dic = @{
                          @".tag": @"folder",
                          @"url": @"https://www.dropbox.com/sh/s6fvw6ol7rmqo1x/AAAgWRSbjmYDvPpDB30Sykjfa?dl=0",
                          @"name": @"Math",
                          @"link_permissions": @{
                                  @"can_revoke": @NO,
                                  @"resolved_visibility": @{
                                          @".tag": @"public"
                                          },
                                  @"revoke_failure_reason": @{
                                          @".tag": @"owner_only"
                                          }
                                  },
                          @"id": @"id:a4ayc_80_OEAAAAAAAAAXw",
                          @"path_lower": @"/homework/math",
                          @"team_member_info": @{
                                  @"team_info": @{
                                          @"id": @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                                          @"name": @"Acme, Inc."
                                          },
                                  @"display_name": @"Roger Rabbit",
                                  @"member_id": @"dbmid:abcd1234"
                                  }
                          };
    
    DropboxSharedLinkMetadata *meta = [DropboxSharedLinkMetadataParseManager metadataWithDictionary:dic];
    
    XCTAssertTrue([meta isKindOfClass:[DropboxFolderLinkMetadata class]]);
}


@end
