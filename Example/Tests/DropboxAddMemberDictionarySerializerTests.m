//
//  DropboxAddMemberDictionarySerializerTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxAddMember+DictionarySerializer.h"

@interface DropboxAddMemberDictionarySerializerTests : XCTestCase

@end

@implementation DropboxAddMemberDictionarySerializerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary {
    NSString *email = @"a;sldkjf;lad";
    DropboxMemberSelector *member = [[DropboxMemberSelector alloc] initWithEmail:email];
    DropboxAddMember *dam = [[DropboxAddMember alloc] initWithMember:member accessLevel:DALEditor];
    
    NSDictionary *dic = [dam dictionaryFromParams];
    
    NSDictionary *expectedDic = @{
                                  @"member": @{@".tag": @"email",
                                               @"email": email
                                              },
                                  @"access_level": @{
                                      @".tag": @"editor"
                                  }};
    XCTAssertEqualObjects(dic, expectedDic);
}


@end
