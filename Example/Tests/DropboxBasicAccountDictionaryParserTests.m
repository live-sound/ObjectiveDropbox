//
//  DropboxBasicAccountDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 27.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxBasicAccount+DictionaryParser.h"

@interface DropboxBasicAccountDictionaryParserTests : XCTestCase

@property DropboxBasicAccount *sut;

@end

@implementation DropboxBasicAccountDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionary1 {
    NSString *accountID = @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc";
    NSString *email = @"franz@dropbox.com";
    BOOL emailVerified = YES;
    BOOL disabled = NO;
    BOOL isTeammate = NO;
    NSString *profilePhotoUrl = @"https://dl-web.dropbox.com/account_photo/get/dbid%3AAAH4f99T0taONIb-OurWxbNQ6ywGRopQngc?vers=1453416696524&size=128x128";
    NSDictionary *dic = @{
                          @"account_id": accountID,
                          @"name": @{
                                  @"given_name": @"Franz",
                                  @"surname": @"Ferdinand",
                                  @"familiar_name": @"Franz",
                                  @"display_name": @"Franz Ferdinand (Personal)"
                                  },
                          @"email": email,
                          @"email_verified": @(emailVerified),
                          @"disabled": @(disabled),
                          @"is_teammate": @(isTeammate),
                          @"profile_photo_url": profilePhotoUrl
                          };
    
    self.sut = [[DropboxBasicAccount alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.sut.accountID, accountID);
    XCTAssertNotNil(self.sut.name);
    XCTAssertEqualObjects(self.sut.email, email);
    XCTAssertEqual(self.sut.emailVerified, emailVerified);
    XCTAssertEqual(self.sut.disabled, disabled);
    XCTAssertEqual(self.sut.isTeammate, isTeammate);
    XCTAssertEqualObjects(self.sut.profilePhotoUrl, profilePhotoUrl);
    XCTAssertNil(self.sut.teamMemberID);
}

- (void)testDictionary2 {
    NSString *accountID = @"dbid:AAH4f99T0taONIb-OurWxbNQ6ywGRopQngc";
    NSString *email = @"franz@dropbox.com";
    BOOL emailVerified = YES;
    BOOL disabled = NO;
    BOOL isTeammate = YES;
    NSString *teamMemberID = @"a;sdlfa;lskdfj";
    NSString *profilePhotoUrl = @"https://dl-web.dropbox.com/account_photo/get/dbid%3AAAH4f99T0taONIb-OurWxbNQ6ywGRopQngc?vers=1453416696524&size=128x128";
    NSDictionary *dic = @{
                          @"account_id": accountID,
                          @"name": @{
                                  @"given_name": @"Franz",
                                  @"surname": @"Ferdinand",
                                  @"familiar_name": @"Franz",
                                  @"display_name": @"Franz Ferdinand (Personal)"
                                  },
                          @"email": email,
                          @"email_verified": @(emailVerified),
                          @"disabled": @(disabled),
                          @"is_teammate": @(isTeammate),
                          @"profile_photo_url": profilePhotoUrl,
                          @"team_member_id": teamMemberID
                          };
    
    self.sut = [[DropboxBasicAccount alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.sut.accountID, accountID);
    XCTAssertNotNil(self.sut.name);
    XCTAssertEqualObjects(self.sut.email, email);
    XCTAssertEqual(self.sut.emailVerified, emailVerified);
    XCTAssertEqual(self.sut.disabled, disabled);
    XCTAssertEqual(self.sut.isTeammate, isTeammate);
    XCTAssertEqualObjects(self.sut.profilePhotoUrl, profilePhotoUrl);
    XCTAssertEqualObjects(self.sut.teamMemberID, teamMemberID);
}


@end
