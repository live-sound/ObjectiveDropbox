//
//  DropboxFullAccountDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 28.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxFullAccount+DictionaryParser.h"

@interface DropboxFullAccountDictionaryParserTests : XCTestCase

@property DropboxFullAccount *result;

@end

@implementation DropboxFullAccountDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDictionaryWithPairedAccount {
    NSString *accountID = @"as;dkjfa;sjkdfl";
    NSString *email = @"a;sdj;falsf";
    BOOL emailVerified = YES;
    BOOL disabled = NO;
    NSString *locale = @"en";
    NSString *referralLink = @"a;lsdjf;lasdf";
    BOOL isPaired = YES;
    NSString *country = @"US";
    NSString *teamMemberID = @"a;sdkjlfa;lsdf;lasjf";
    
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
                          @"locale": locale,
                          @"referral_link": referralLink,
                          @"is_paired": @(isPaired),
                          @"account_type": @{
                                  @".tag": @"business"
                                  },
                          @"country": country,
                          @"team": @{
                                  @"id": @"dbtid:AAFdgehTzw7WlXhZJsbGCLePe8RvQGYDr-I",
                                  @"name": @"Acme, Inc.",
                                  @"sharing_policies": @{
                                          @"shared_folder_member_policy": @{
                                                  @".tag": @"team"
                                                  },
                                          @"shared_folder_join_policy": @{
                                                  @".tag": @"from_anyone"
                                                  },
                                          @"shared_link_create_policy": @{
                                                  @".tag": @"team_only"
                                                  }
                                          }
                                  },
                          @"team_member_id": teamMemberID
                          };
    
    self.result = [[DropboxFullAccount alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.accountID, accountID);
    XCTAssertEqualObjects(self.result.email, email);
    XCTAssertEqual(self.result.emailVerified, emailVerified);
    XCTAssertEqual(self.result.disabled, disabled);
    XCTAssertEqualObjects(self.result.locale, locale);
    XCTAssertEqualObjects(self.result.referralLink, referralLink);
    XCTAssertEqual(self.result.isPaired, isPaired);
    XCTAssertEqualObjects(self.result.country, country);
    XCTAssertEqualObjects(self.result.teamMemberID, teamMemberID);
    XCTAssertNotNil(self.result.name);
    XCTAssertEqual(self.result.accountType, DATBusiness);
    XCTAssertNotNil(self.result.team);
}

- (void)testDictionaryWithNotPairedAccount {
    NSString *accountID = @"as;dkjfa;sjkdfl";
    NSString *email = @"a;sdj;falsf";
    BOOL emailVerified = YES;
    BOOL disabled = NO;
    NSString *locale = @"en";
    NSString *referralLink = @"a;lsdjf;lasdf";
    BOOL isPaired = NO;
    NSString *country = @"US";
        
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
                          @"locale": locale,
                          @"referral_link": referralLink,
                          @"is_paired": @(isPaired),
                          @"account_type": @{
                                  @".tag": @"basic"
                                  },
                          @"country": country
                          };
    
    self.result = [[DropboxFullAccount alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.result.accountID, accountID);
    XCTAssertEqualObjects(self.result.email, email);
    XCTAssertEqual(self.result.emailVerified, emailVerified);
    XCTAssertEqual(self.result.disabled, disabled);
    XCTAssertEqualObjects(self.result.locale, locale);
    XCTAssertEqualObjects(self.result.referralLink, referralLink);
    XCTAssertEqual(self.result.isPaired, isPaired);
    XCTAssertEqualObjects(self.result.country, country);
    XCTAssertNotNil(self.result.name);
    XCTAssertEqual(self.result.accountType, DATBasic);
    XCTAssertNil(self.result.team);
    XCTAssertNil(self.result.teamMemberID);
}


@end
