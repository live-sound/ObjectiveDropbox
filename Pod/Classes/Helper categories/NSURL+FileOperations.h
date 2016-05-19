//
//  NSURL+FileSize.h
//  Pods
//
//  Created by Михаил Мотыженков on 11.05.16.
//
//

#import <Foundation/Foundation.h>

@interface NSURL (FileOperations)

- (NSArray<NSURL *> * _Nullable)splitFileBySizeInBytes:(unsigned long)pieceSize error:(NSError * _Nullable * _Nullable)error;
- (unsigned long long)fileSizeWithError:(NSError * _Nullable * _Nullable)error;

@end
