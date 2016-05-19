//
//  DropboxSplitFileCategoryTests.m
//  ObjectiveDropbox
//
//  Created by Михаил Мотыженков on 11.05.16.
//  Copyright © 2016 Mikhail Motyzhenkov. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NSURL+FileOperations.h"

@interface DropboxNSURLFileOperationsTests : XCTestCase

@end

@implementation DropboxNSURLFileOperationsTests
{
    NSString * dir;
    NSFileManager *fm;
}

- (void)setUp {
    [super setUp];    
    dir = [NSTemporaryDirectory() stringByAppendingPathComponent:@"tempDir"];
    fm = [NSFileManager defaultManager];
    [fm createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
}

- (void)tearDown {
    [fm removeItemAtPath:dir error:nil];
    [super tearDown];
}

- (NSURL *)mergeFileFromPieces:(NSArray<NSURL *> *)pieces inDir:(NSString *)baseDir
{
    if (pieces.count < 1) return nil;
    
    NSURL *resultUrl = [NSURL fileURLWithPath:[baseDir stringByAppendingPathComponent:[NSString stringWithFormat:@"%i_backToLife.ahh", arc4random() % 99999]]];
    NSMutableData *resultData = [[NSMutableData alloc] init];
    for (NSURL *url in pieces)
    {
        [resultData appendData:[NSData dataWithContentsOfURL:url]];
    }
    [resultData writeToURL:resultUrl atomically:NO];
    return resultUrl;
}

- (void)testBigFile {
    NSUInteger size = 2 * 1024 * 1024;
    NSUInteger splitSize = 512*1024;
    NSMutableData *md = [[NSMutableData alloc] initWithLength:size];
    NSURL *fileUrl = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:@"testBigFile.omg"]];
    [md writeToURL:fileUrl atomically:NO];
    NSURL *fileUrlCopy = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:@"testBigFileCopy.omg"]];
    [fm copyItemAtURL:fileUrl toURL:fileUrlCopy error:nil];
    
    NSArray<NSURL *> *result = [fileUrl splitFileBySizeInBytes:splitSize error:nil];
    
    XCTAssertFalse([fm fileExistsAtPath:fileUrl.absoluteString]);
    XCTAssertEqual(result.count, ceil(((double)size)/splitSize));
    NSURL *mergedCopy = [self mergeFileFromPieces:result inDir:dir];
    NSData *mergedData = [NSData dataWithContentsOfURL:mergedCopy];
    NSData *data = [NSData dataWithContentsOfURL:fileUrlCopy];
    XCTAssertTrue([data isEqualToData:mergedData]);
    data = mergedData = nil;
    
    [fm removeItemAtURL:fileUrlCopy error:nil];
    for (NSURL *url in result)
    {
        [fm removeItemAtURL:url error:nil];
    }
    
    [fm removeItemAtURL:fileUrl error:nil];
}

- (void)testTinyFileWithSizeLessThanSplitSize {
    NSUInteger size = 2 * 1024;
    NSUInteger splitSize = 3 * 1024;
    NSMutableData *md = [[NSMutableData alloc] initWithLength:size];
    NSURL *fileUrl = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:@"testTinyFileWithSizeLessThanSplitSize.omg"]];
    [md writeToURL:fileUrl atomically:NO];
    md = nil;
    NSURL *fileUrlCopy = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:@"testTinyFileWithSizeLessThanSplitSizeCopy.omg"]];
    [fm copyItemAtURL:fileUrl toURL:fileUrlCopy error:nil];
    
    NSArray<NSURL *> *result = [fileUrl splitFileBySizeInBytes:splitSize error:nil];
    
    XCTAssertFalse([fm fileExistsAtPath:fileUrl.absoluteString]);
    XCTAssertEqual(result.count, 1);
    NSURL *mergedCopy = [self mergeFileFromPieces:result inDir:dir];
    NSData *mergedData = [NSData dataWithContentsOfURL:mergedCopy];
    NSData *data = [NSData dataWithContentsOfURL:fileUrlCopy];
    XCTAssertTrue([data isEqualToData:mergedData]);
    data = mergedData = nil;
    [fm removeItemAtURL:fileUrlCopy error:nil];
    
    for (NSURL *url in result)
    {
        [fm removeItemAtURL:url error:nil];
    }
    [fm removeItemAtURL:fileUrl error:nil];
}

- (void)testNonExistingFile {
    NSURL *fileUrl = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:@"testNonExistingFile.omg"]];
    
    NSError *error;
    NSArray<NSURL *> *result = [fileUrl splitFileBySizeInBytes:8 error:&error];
    
    XCTAssertNil(result);
    XCTAssertNotNil(error);
    [fm removeItemAtURL:fileUrl error:nil];
}


@end
