//
//  DropboxTeamDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 22.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxTeam+DictionaryParser.h"

@interface DropboxTeamDictionaryParserTests : XCTestCase

@property DropboxTeam *team;

@end

@implementation DropboxTeamDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    NSString *ID = @"a;sldkf;alsdfjk";
    NSString *name = @"a;lsdkjf;alskdf;las";
    NSDictionary *dic = @{ @"id": ID,
                           @"name": name };
    
    self.team = [[DropboxTeam alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.team.ID, ID);
    XCTAssertEqualObjects(self.team.name, name);
}

- (void)testDictionaryWithBadID {
    id ID = @34;
    NSString *name = @"a;lsdkjf;alskdf;las";
    NSDictionary *dic = @{ @"id": ID,
                           @"name": name };
    
    self.team = [[DropboxTeam alloc] initWithDictionary:dic];
    
    XCTAssertNil(self.team.ID);
    XCTAssertEqualObjects(self.team.name, name);
}

- (void)testDictionaryWithBadName {
    NSString *ID = @"a;sldkf;alsdfjk";
    NSDictionary *dic = @{ @"id": ID,
                           @"name": [NSNull null] };
    
    self.team = [[DropboxTeam alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects(self.team.ID, ID);
    XCTAssertNil(self.team.name);
}


@end
