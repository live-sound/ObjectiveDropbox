//
//  DropboxSearchMatchDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 21.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxSearchMatch+DictionaryParser.h"
#import "DropboxFileMetadata.h"

@interface DropboxSearchMatchDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxSearchMatch *result;

@end

@implementation DropboxSearchMatchDictionaryParserTests

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
                          @"match_type": @{
                              @".tag": @"content"
                          },
                          @"metadata": @{
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
                                                  ],
                              @"has_explicit_shared_members": @NO
                          }
                          };
    DropboxSearchMatch *dsm = [[DropboxSearchMatch alloc] initWithDictionary:dic];
    
    XCTAssertEqual(dsm.matchType, content);
    XCTAssertTrue([dsm.metadata isKindOfClass:[DropboxFileMetadata class]]);
}

- (void)testDictionaryWithBadTag {
    NSDictionary *dic = @{
                          @"match_type": @{
                                  @"tag?": @"content"
                                  },
                          @"metadata": @{
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
                                          ],
                                  @"has_explicit_shared_members": @NO
                                  }
                          };
    DropboxSearchMatch *dsm = [[DropboxSearchMatch alloc] initWithDictionary:dic];
    
    XCTAssertEqual(dsm.matchType, unknown);
    XCTAssertTrue([dsm.metadata isKindOfClass:[DropboxFileMetadata class]]);
}

- (void)testDictionaryWithBadMetadata {
    NSDictionary *dic = @{
                          @"match_type": @{
                                  @".tag": @"content"
                                  },
                          @"metadataa": @{
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
                                          ],
                                  @"has_explicit_shared_members": @NO
                                  }
                          };
    DropboxSearchMatch *dsm = [[DropboxSearchMatch alloc] initWithDictionary:dic];
    
    XCTAssertEqual(dsm.matchType, content);
    XCTAssertNil(dsm.metadata);
}

- (void)testEmptyDictionary {
    NSDictionary *dic = @{};
    DropboxSearchMatch *dsm = [[DropboxSearchMatch alloc] initWithDictionary:dic];
    
    XCTAssertEqual(dsm.matchType, unknown);
    XCTAssertNil(dsm.metadata);
}


@end
