//
//  DropboxPhotoMetadataDictionaryParserTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 09.04.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DropboxPhotoMetadata+DictionaryParser.h"
#import "NSDate+DateToDropboxString.h"

@interface DropboxPhotoMetadataDictionaryParserTests : XCTestCase

@property (nonatomic) DropboxPhotoMetadata *meta;

@end

@implementation DropboxPhotoMetadataDictionaryParserTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGoodDictionary {
    DropboxDimensions *dim = [DropboxDimensions new];
    dim.width = 100;
    dim.height = 200;
    
    DropboxGpsCoordinates *gps = [DropboxGpsCoordinates new];
    gps.latitude = 28.8;
    gps.longitude = 434;
    
    NSString *timeStamp = @"2015-02-28T22:30:01Z";
    
    NSDictionary *dic = @{@"dimensions": @{@"width": @(dim.width), @"height": @(dim.height)},
                          @"location": @{@"latitude": @(gps.latitude), @"longitude": @(gps.longitude)},
                          @"time_taken": timeStamp};
    
    self.meta = [[DropboxPhotoMetadata alloc] initWithDictionary:dic];
    
    XCTAssertEqualObjects([self.meta.timeTaken dropboxDate], timeStamp);
    XCTAssertEqualObjects(self.meta.location, gps);
    XCTAssertEqualObjects(self.meta.dimensions, dim);
}

- (void)testBadDictionary
{
    id nul = [NSNull null];
    NSDictionary *dic = @{@"time_taken": nul};
    
    XCTAssertNoThrow(self.meta = [[DropboxPhotoMetadata alloc] initWithDictionary:dic]);
}

- (void)testEmptyDictionary
{
    NSDictionary *dic = @{};
    
    XCTAssertNoThrow(self.meta = [[DropboxPhotoMetadata alloc] initWithDictionary:dic]);
}

@end
