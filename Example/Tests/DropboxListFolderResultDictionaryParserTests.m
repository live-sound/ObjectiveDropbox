//
//  DropboxListFolderResultDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxListFolderResult+DictionaryParser.h"

@interface DropboxListFolderResultDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxListFolderResult *result;

@end

@implementation DropboxListFolderResultDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSDictionary *dic = @{
                          @"entries": @[
                                      @{
                                          @".tag": @"file",
                                          @"name": @"Prime_Numbers.txt",
                                          @"path_lower": @"/homework/math/prime_numbers.txt",
                                          @"path_display": @"/Homework/math/Prime_Numbers.txt",
                                          @"id": @"id:a4ayc_80_OEAAAAAAAAAXw",
                                          @"client_modified": @"2015-05-12T15:50:38Z",
                                          @"server_modified": @"2015-05-12T15:50:38Z",
                                          @"rev": @"a1c10ce0dd78",
                                          @"size": @7212,
                                          @"sharing_info": @{
                                              @"read_only": @YES,
                                              @"parent_shared_folder_id": @"84528192421",
                                              @"modified_by": @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc"
                                          },
                                          @"property_groups": @[
                                                              @{
                                                                  @"template_id": @"ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                                                                  @"fields": @[
                                                                             @{
                                                                                 @"name": @"Security Policy",
                                                                                 @"value": @"Confidential"
                                                                             }
                                                                             ]
                                                              }
                                                              ]
                                      },
                                      @{
                                          @".tag": @"folder",
                                          @"name": @"math",
                                          @"path_lower": @"/homework/math",
                                          @"path_display": @"/Homework/math",
                                          @"id": @"id:a4ayc_80_OEAAAAAAAAAXz",
                                          @"sharing_info": @{
                                              @"read_only": @NO,
                                              @"parent_shared_folder_id": @"84528192421"
                                          },
                                          @"property_groups": @[
                                                              @{
                                                                  @"template_id": @"ptid:1a5n2i6d3OYEAAAAAAAAAYa",
                                                                  @"fields": @[
                                                                             @{
                                                                                 @"name": @"Security Policy",
                                                                                 @"value": @"Confidential"
                                                                             }
                                                                             ]
                                                              }
                                                              ]
                                      }
                                      ],
                          @"cursor": @"ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu",
                          @"has_more": @NO
                          };
    
    self.result = [[DropboxListFolderResult alloc] initWithDictionary:dic];
    
    XCTAssertEqual(self.result.entries.count, 2);
    XCTAssertEqualObjects(self.result.cursor, @"ZtkX9_EHj3x7PMkVuFIhwKYXEpwpLwyxp9vMKomUhllil9q7eWiAu");
    XCTAssertEqual(self.result.hasMore, NO);
}

- (void)testBadDictionary
{
    NSDictionary *dic = @{@"entries": @{}, @"has_more": @"bla-bla-bla"};
    
    XCTAssertNoThrow(self.result = [[DropboxListFolderResult alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.result = [[DropboxListFolderResult alloc] initWithDictionary:dic]);
}


@end
