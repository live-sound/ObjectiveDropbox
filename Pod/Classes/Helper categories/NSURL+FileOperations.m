//
//  NSURL+FileSize.m
//  Pods
//
//  Created by Михаил Мотыженков on 11.05.16.
//
//

#import "NSURL+FileOperations.h"

int const chunkSize = 2048;

@implementation NSURL (FileOperations)

- (NSURL *)createPieceFromFileHandle:(NSFileHandle **)fh withLength:(unsigned long)length andWithDir:(NSString *)dir andWithFileName:(NSString *)fileName andNumber:(unsigned long long)num
{
    NSURL *url = [NSURL fileURLWithPath:[dir stringByAppendingPathComponent:[NSString stringWithFormat:@"%@_%llu.part", fileName, num]]];
    
    // Create new empty file for FileHandle
    [[NSData new] writeToURL:url atomically:NO];
    
    NSError *error;
    NSFileHandle *fileWriter = [NSFileHandle fileHandleForWritingToURL:url error:&error];
    if (error) return nil;
    
    while (YES) {
        NSData *chunk = [*fh readDataOfLength:chunkSize];
        NSUInteger len = chunk.length;
        [fileWriter writeData:chunk];
        if (len == 0) break;
    }
    [fileWriter closeFile];
    fileWriter = nil;
    return url;
}

- (NSString *)getDirPath
{
    return [self.path stringByDeletingLastPathComponent];
}

- (NSArray<NSURL *> *)splitFileBySizeInBytes:(unsigned long)pieceSize error:(NSError *__autoreleasing * _Nullable)error
{
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingFromURL:self error:error];
    if (!fileHandle)
    {
        fileHandle = nil;
        return nil;
    }
    error = nil;
    unsigned long long size = [self fileSizeWithError:error];
    if (error)
    {
        return nil;
    }
    if (size <= pieceSize)
    {
        return @[self];
    }
    
    NSFileManager *fm = [NSFileManager defaultManager];
    NSMutableArray<NSURL *> *result = [NSMutableArray new];
    
    unsigned long long countOfFullPieces = size/pieceSize;
    unsigned long long i;
    for (i = 0; i < countOfFullPieces; i++)
    {
        NSURL *url = [self createPieceFromFileHandle:&fileHandle withLength:pieceSize andWithDir:[self getDirPath] andWithFileName:self.lastPathComponent.stringByDeletingPathExtension andNumber:i];
        [result addObject:url];
    }
    unsigned long lastPieceSize = size % pieceSize;
    if (lastPieceSize > 0)
    {
        NSURL *url = [self createPieceFromFileHandle:&fileHandle withLength:lastPieceSize andWithDir:[self getDirPath] andWithFileName:self.lastPathComponent.stringByDeletingPathExtension andNumber:i];
        [result addObject:url];
    }
    [fileHandle closeFile];
    fileHandle = nil;
    [fm removeItemAtURL:self error:error];
    return [result copy];
}

- (unsigned long long)fileSizeWithError:(NSError **)error
{
    NSFileWrapper *wrapper = [[NSFileWrapper alloc] initWithURL:self options:NSFileWrapperReadingImmediate error:&(*error)];
    if (error)
    {
        return 0;
    }
    
    NSNumber *sizeNum = wrapper.fileAttributes[NSFileSize];
    unsigned long long size = sizeNum.longLongValue;
    return size;
}

@end
