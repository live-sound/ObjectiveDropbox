//
//  DropboxAddFolderMemberArgDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAddFolderMemberArg+DictionarySerializer.h"

@interface DropboxAddFolderMemberArgDictionarySerializerTests : XCTestCase

@end

@implementation DropboxAddFolderMemberArgDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *sharedFolderID = @"84528192421";
    NSArray *members = @[
                         [[DropboxAddMember alloc] initWithMember:[[DropboxMemberSelector alloc] initWithEmail:@"justin@example.com"] accessLevel:DALEditor],
                         [[DropboxAddMember alloc] initWithMember:[[DropboxMemberSelector alloc] initWithDropboxID:@"dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"] accessLevel:DALViewer]
                         ];
    BOOL quiet = NO;
    NSString *customMessage = @"Documentation for launch day";
    
    DropboxAddFolderMemberArg *arg = [[DropboxAddFolderMemberArg alloc] initWithSharedFolderID:sharedFolderID members:members quiet:quiet customMessage:customMessage];
    NSDictionary *dic = [arg dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"shared_folder_id": @"84528192421",
                                  @"members": @[
                                          @{
                                              @"member": @{
                                                      @".tag": @"email",
                                                      @"email": @"justin@example.com"
                                                      },
                                              @"access_level": @{
                                                      @".tag": @"editor"
                                                      }
                                              },
                                          @{
                                              @"member": @{
                                                      @".tag": @"dropbox_id",
                                                      @"dropbox_id": @"dbid:AAEufNrMPSPe0dMQijRP0N_aZtBJRm26W4Q"
                                                      },
                                              @"access_level": @{
                                                      @".tag": @"viewer"
                                                      }
                                              }
                                          ],
                                  @"quiet": @NO,
                                  @"custom_message": @"Documentation for launch day"
                                  };
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
